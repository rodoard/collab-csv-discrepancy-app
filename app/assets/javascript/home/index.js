window.Home = {
  index: function(){
    const submit = document.getElementById("submit");
    const csvFilesHelpMessages= document.getElementById("csv-files-help-messages");
    const csvFiles= document.getElementById("csv-files");
    csvFiles.addEventListener("change", handleFiles, false);
    function handleFiles(initialPageLoad) {
      const fileList = this.files || csvFiles.files; 
      if (!fileList) return
      if (fileList.length < 2 || fileList.length > 2) {
        if (initialPageLoad !== true) setMessage("Exactly 2 files are required.")
        disableSubmit()
      }
       if (fileList.length == 2) {
        clearMessage()
        enableSubmit()
      }
    }
    function disableSubmit(){
      submit.disabled = true
    }
    function enableSubmit(){
      submit.disabled = false
    }
    function clearMessage(){
       csvFilesHelpMessages.innerHTML = ""
    }
    function setMessage(message){
      csvFilesHelpMessages.innerHTML = message
    }
     handleFiles(true)
  }
}
