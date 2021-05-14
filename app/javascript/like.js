window.addEventListener("DOMContentLoaded", () => {
  const LikeHeart = document.getElementsByClassName("likes_heart")

  likesA = Array.from(LikeHeart);
  likesA.forEach((likeB, index) => {
    likeB.setAttribute("id", `${index + 1}` )
    likeB.addEventListener('click', function(e){
      // passive: false;
      e.preventDefault();
      const likeId = likeB.getAttribute("like-data")
      const XHR = new XMLHttpRequest();
      XHR.open("POST", `/posts/${likeId}/likes`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        console.log("ok")
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
        } else {
          return null;          
        }
        const item = XHR.response.like;
        const html = `


                      `
      };
    }, { passive: false });
  });
})
