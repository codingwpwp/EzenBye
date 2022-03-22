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
           window.open("popup.do","a","width=400, height=300, left=800, top=500");
        	
        }
        function best(){
            var text = prompt("금:1 | 은:2 | 동:3");
        }