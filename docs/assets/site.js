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
    })
    .catch(function (err) {
      mount.innerHTML =
        '<p class="loading" style="animation:none">FEED UNAVAILABLE — ' + err.message +
        '. <a href="' + rawUrl + '">View the raw file on GitHub</a>.</p>';
    });
}
