$('#summernote').summernote({
    placeholder: 'Hello stand alone ui',
    tabsize: 2,
    height: 400,
    maxHeight: 400,
    toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
    ]
});
function popup(){
    window.open("popup.do","a","width=300,height=200","left=100,top=50");
}