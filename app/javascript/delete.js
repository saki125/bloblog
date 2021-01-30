window.addEventListener("DOMContentLoaded", () => {
  const postDelete = document.getElementById("post-delete")
  postDelete.addEventListener("click", () => {
    debugger
    if (confirm("本当に削除しますか？") == true) {
      const deleteStatus = true;
      const deleteHtml = `<input value=${deleteStatus} type="hidden" name='post_delete'>`;
      postDelete.insertAdjacentHTML('beforeend',deleteHtml )
    } else {
      alert("削除をキャンセルしました");
    }
  })
})