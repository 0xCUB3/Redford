const openInRedfordBanner = `<div id="RedfordBanner"> <img src="https://redford.cafe/james-webb.jpg" class="RedfordBannerBg"><div class="logoHeyWrapper"> <img src="https://redford.cafe/side-redford-tinyfied.png"><div>Hey!</div></div><a href="Redfordapp:/${url}" class="openInRedfordButton">Open in Redford!</a><button id="closeBannerButton" style="">X</button></div>`
document.body.insertAdjacentHTML("beforeend", openInRedfordBanner)
setTimeout(() => {
  document.getElementById("closeBannerButton").addEventListener("click", function () {
    removeElementByQuery("#RedfordBanner")
  })
}, 100)
