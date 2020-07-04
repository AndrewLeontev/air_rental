$(document).on('change', '#uploaded-file1', previewImages)

function previewImages() {

  let $preview = $('#preview').empty();
  if (this.files) $.each(this.files, readAndPreview);

  function readAndPreview(i, file) {
    if (!/\.(jpe?g|png|gif)$/i.test(file.name)){
      return alert(file.name +" is not an image");
    }

    let reader = new FileReader();
    file.guid = createGuid()

    $(reader).on("load", function() {
      let p_block = $('<p>', {height:150, width:150, class:'col-md-3'});
      p_block = p_block.append($('<img/>', {src:this.result, height:150, width:150}));
      $preview.append(p_block);
    });

    reader.readAsDataURL(file);
  }
}

function createGuid()
{
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random()*16|0, v = c === 'x' ? r : (r&0x3|0x8);
    return v.toString(16);
  });
}