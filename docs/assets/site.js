(function () {
  var path = location.pathname.split("/").pop() || "index.html";
  document.querySelectorAll(".nav-links a").forEach(function (a) {
    if (a.getAttribute("href") === path) a.classList.add("active");
  });

  if (!("IntersectionObserver" in window)) {
    document.querySelectorAll(".reveal").forEach(function (el) { el.classList.add("in"); });
    return;
  }
  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (e) {
      if (e.isIntersecting) {
        e.target.classList.add("in");
        io.unobserve(e.target);
      }
    });
  }, { rootMargin: "0px 0px -8% 0px" });
  document.querySelectorAll(".reveal").forEach(function (el) { io.observe(el); });
})();

function slugify(text) {
  return text.toLowerCase().trim()
    .replace(/[✀-➿☀-⛿️‍]|[\ud800-\udbff][\udc00-\udfff]/g, "")
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/^-+|-+$/g, "");
}

function renderMarkdown(rawUrl, mountId, postProcess) {
  var mount = document.getElementById(mountId);
  fetch(rawUrl)
    .then(function (r) {
      if (!r.ok) throw new Error("HTTP " + r.status);
      return r.text();
    })
    .then(function (md) {
      marked.setOptions({ gfm: true, breaks: false });
      var html = DOMPurify.sanitize(marked.parse(md), { ADD_TAGS: ["details", "summary"] });
      mount.innerHTML = html;
      mount.querySelectorAll("h1, h2, h3, h4").forEach(function (h) {
        if (!h.id) h.id = slugify(h.textContent);
      });
      mount.querySelectorAll("a[href]").forEach(function (a) {
        var href = a.getAttribute("href");
        if (/^https?:/.test(href) && a.host !== location.host) {
          a.target = "_blank";
          a.rel = "noopener";
        }
      });
      if (postProcess) postProcess(mount);
      if (location.hash) {
        var anchor = document.getElementById(location.hash.slice(1));
        if (anchor) {
          window.scrollTo({ top: anchor.getBoundingClientRect().top + window.scrollY - 84, behavior: "instant" });
        }
      }
    })
    .catch(function (err) {
      mount.innerHTML =
        '<p class="loading" style="animation:none">FEED UNAVAILABLE — ' + err.message +
        '. <a href="' + rawUrl + '">View the raw file on GitHub</a>.</p>';
    });
}

(function () {
  var reduce = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  var SoundFX = (function () {
    var ctx = null, master = null, on = false;
    function ensure() {
      if (!ctx) {
        var AC = window.AudioContext || window.webkitAudioContext;
        if (!AC) return false;
        ctx = new AC();
        master = ctx.createGain();
        master.gain.value = 0;
        master.connect(ctx.destination);
      }
      if (ctx.state === "suspended") ctx.resume();
      return true;
    }
    function tone(freq, dur, type, vol, glideTo) {
      if (!on || !ctx) return;
      var t = ctx.currentTime;
      var o = ctx.createOscillator(), g = ctx.createGain();
      o.type = type;
      o.frequency.setValueAtTime(freq, t);
      if (glideTo) o.frequency.exponentialRampToValueAtTime(glideTo, t + dur);
      g.gain.setValueAtTime(0.0001, t);
      g.gain.exponentialRampToValueAtTime(vol, t + 0.006);
      g.gain.exponentialRampToValueAtTime(0.0001, t + dur);
      o.connect(g); g.connect(master);
      o.start(t); o.stop(t + dur + 0.02);
    }
    return {
      setOn: function (v) { on = v; if (on) { if (!ensure()) { on = false; return; } master.gain.value = 0.14; } else if (master) { master.gain.value = 0; } },
      isOn: function () { return on; },
      hover: function () { tone(2300, 0.028, "square", 0.18); },
      click: function () { tone(900, 0.05, "square", 0.4); tone(1500, 0.04, "square", 0.22); },
      woosh: function () { tone(240, 0.2, "sawtooth", 0.3, 1200); }
    };
  })();

  var navWrap = document.querySelector(".site-nav .wrap");
  if (navWrap) {
    var btn = document.createElement("button");
    btn.type = "button";
    btn.className = "cb-sound";
    btn.setAttribute("aria-pressed", "false");
    btn.setAttribute("aria-label", "Toggle interface sound");
    btn.innerHTML = '<span class="dot" aria-hidden="true"></span>SFX';
    var cta = navWrap.querySelector(".nav-cta");
    if (cta) navWrap.insertBefore(btn, cta); else navWrap.appendChild(btn);

    function persist(v) { try { localStorage.setItem("cb-sound", v ? "1" : "0"); } catch (e) {} }
    function read() { try { return localStorage.getItem("cb-sound") === "1"; } catch (e) { return false; } }

    btn.addEventListener("click", function () {
      SoundFX.setOn(!SoundFX.isOn());
      btn.setAttribute("aria-pressed", SoundFX.isOn() ? "true" : "false");
      persist(SoundFX.isOn());
      if (SoundFX.isOn()) SoundFX.click();
    });

    if (read()) {
      btn.setAttribute("aria-pressed", "true");
      var arm = function () { SoundFX.setOn(true); btn.setAttribute("aria-pressed", SoundFX.isOn() ? "true" : "false"); document.removeEventListener("pointerdown", arm); };
      document.addEventListener("pointerdown", arm, { once: true });
    }

    document.addEventListener("mouseover", function (e) {
      if (!SoundFX.isOn() || !e.target.closest) return;
      var el = e.target.closest(".nav-links a, .nav-cta, .btn, .link-card, .lo-tab, .cb-sound");
      if (el && !el.contains(e.relatedTarget)) SoundFX.hover();
    });
  }

  var wipe = document.createElement("div");
  wipe.className = "cb-wipe";
  document.body.appendChild(wipe);
  function navDest(a) {
    if (!a) return null;
    var href = a.getAttribute("href");
    if (!href || href.charAt(0) === "#") return null;
    if (a.target === "_blank" || a.hasAttribute("download")) return null;
    if (/^(mailto:|tel:|javascript:)/i.test(href)) return null;
    var url;
    try { url = new URL(a.href, location.href); } catch (e) { return null; }
    if (url.origin !== location.origin) return null;
    if (/\.(jpe?g|png|webp|gif|svg|pdf|zip|7z|mp4|webm)$/i.test(url.pathname)) return null;
    if (url.pathname === location.pathname && url.hash) return null;
    return url.href;
  }
  document.addEventListener("click", function (e) {
    if (e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return;
    var a = e.target.closest && e.target.closest("a");
    var dest = navDest(a);
    if (!dest) return;
    e.preventDefault();
    if (SoundFX.isOn()) { SoundFX.click(); SoundFX.woosh(); }
    if (reduce) { location.href = dest; return; }
    wipe.classList.add("show");
    setTimeout(function () { location.href = dest; }, 190);
  });

  var cells = Array.prototype.slice.call(document.querySelectorAll(".gallery .g-cell"));
  if (cells.length) {
    var items = cells.map(function (a) { return { href: a.getAttribute("href"), alt: (a.querySelector("img") || {}).alt || "Screenshot" }; });
    var pad = function (n) { return ("0" + n).slice(-2); };

    var lb = document.createElement("div");
    lb.className = "cb-lb";
    lb.setAttribute("hidden", "");
    lb.setAttribute("role", "dialog");
    lb.setAttribute("aria-modal", "true");
    lb.setAttribute("aria-label", "Screenshot viewer");
    lb.innerHTML =
      '<button class="cb-lb-btn cb-lb-close" type="button" aria-label="Close viewer">×</button>' +
      '<button class="cb-lb-btn cb-lb-prev" type="button" aria-label="Previous screenshot">‹</button>' +
      '<figure class="cb-lb-stage"><img alt=""></figure>' +
      '<button class="cb-lb-btn cb-lb-next" type="button" aria-label="Next screenshot">›</button>' +
      '<div class="cb-lb-counter">FEED <b class="cb-lb-i">01</b> / ' + pad(items.length) + '</div>';
    document.body.appendChild(lb);

    var lbImg = lb.querySelector("img");
    var lbIdx = lb.querySelector(".cb-lb-i");
    var idx = 0, lastFocus = null, closeTimer = null;

    function preload(n) { var it = items[(n + items.length) % items.length]; if (it) { var im = new Image(); im.src = it.href; } }
    function show(n) {
      idx = (n + items.length) % items.length;
      lbImg.src = items[idx].href;
      lbImg.alt = items[idx].alt;
      lbIdx.textContent = pad(idx + 1);
      preload(idx + 1); preload(idx - 1);
      if (SoundFX.isOn()) SoundFX.hover();
    }
    function openLb(n) {
      if (closeTimer) { clearTimeout(closeTimer); closeTimer = null; }
      lastFocus = document.activeElement;
      show(n);
      lb.removeAttribute("hidden");
      document.body.classList.add("cb-lb-open");
      if (reduce) lb.classList.add("open");
      else requestAnimationFrame(function () { lb.classList.add("open"); });
      lb.querySelector(".cb-lb-close").focus();
    }
    function closeLb() {
      lb.classList.remove("open");
      document.body.classList.remove("cb-lb-open");
      var done = function () { lb.setAttribute("hidden", ""); lbImg.removeAttribute("src"); };
      if (reduce) done(); else closeTimer = setTimeout(function () { closeTimer = null; done(); }, 200);
      if (lastFocus && lastFocus.focus) lastFocus.focus();
    }

    cells.forEach(function (a, i) {
      a.addEventListener("click", function (e) { e.preventDefault(); openLb(i); });
    });
    lb.querySelector(".cb-lb-close").addEventListener("click", closeLb);
    lb.querySelector(".cb-lb-prev").addEventListener("click", function () { show(idx - 1); });
    lb.querySelector(".cb-lb-next").addEventListener("click", function () { show(idx + 1); });
    lb.addEventListener("click", function (e) { if (e.target === lb) closeLb(); });
    document.addEventListener("keydown", function (e) {
      if (lb.hasAttribute("hidden")) return;
      if (e.key === "Escape") closeLb();
      else if (e.key === "ArrowLeft") show(idx - 1);
      else if (e.key === "ArrowRight") show(idx + 1);
    });
    var tsX = null, tsY = null;
    lb.addEventListener("touchstart", function (e) { var t = e.changedTouches[0]; tsX = t.clientX; tsY = t.clientY; }, { passive: true });
    lb.addEventListener("touchend", function (e) {
      if (tsX === null) return;
      var t = e.changedTouches[0], dx = t.clientX - tsX, dy = t.clientY - tsY;
      if (Math.abs(dx) > 45 && Math.abs(dx) > Math.abs(dy)) { show(dx < 0 ? idx + 1 : idx - 1); }
      tsX = null; tsY = null;
    }, { passive: true });
  }

  if (!("IntersectionObserver" in window)) return;

  var nums = document.querySelectorAll(".stat b, .spec-cell b");
  if (nums.length) {
    var countIO = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (!en.isIntersecting) return;
        countIO.unobserve(en.target);
        var el = en.target;
        var orig = el.getAttribute("data-cb-orig") || el.textContent;
        el.setAttribute("data-cb-orig", orig);
        var groups = orig.match(/\d+/g);
        if (!groups || groups.length !== 1 || reduce) return;
        var m = orig.match(/\d+/);
        var target = parseInt(m[0], 10);
        if (isNaN(target) || target <= 0) return;
        var pre = orig.slice(0, m.index), post = orig.slice(m.index + m[0].length);
        var dur = 850, start = null;
        function frame(ts) {
          if (start === null) start = ts;
          var k = Math.min(1, (ts - start) / dur);
          var v = Math.round(target * (1 - Math.pow(1 - k, 3)));
          el.textContent = pre + v.toLocaleString() + post;
          if (k < 1) requestAnimationFrame(frame); else el.textContent = orig;
        }
        requestAnimationFrame(frame);
      });
    }, { rootMargin: "0px 0px -10% 0px" });
    nums.forEach(function (el) { countIO.observe(el); });
  }

  if (!reduce) {
    var tags = document.querySelectorAll(".sec-tag");
    if (tags.length) {
      var GLY = "#%&/\\<>*01■▒▓";
      var decIO = new IntersectionObserver(function (entries) {
        entries.forEach(function (en) {
          if (!en.isIntersecting) return;
          decIO.unobserve(en.target);
          var el = en.target;
          var target = el.getAttribute("data-cb-text") || el.textContent;
          el.setAttribute("data-cb-text", target);
          var i = 0;
          var iv = setInterval(function () {
            el.textContent = target.split("").map(function (c, j) {
              if (j < i) return c;
              if (c === " " || c === "·") return c;
              return GLY.charAt(Math.floor(Math.random() * GLY.length));
            }).join("");
            i++;
            if (i > target.length) { clearInterval(iv); el.textContent = target; }
          }, 34);
        });
      }, { rootMargin: "0px 0px -6% 0px" });
      tags.forEach(function (el) { decIO.observe(el); });
    }
  }
})();
