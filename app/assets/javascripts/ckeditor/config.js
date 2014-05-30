CKEDITOR.editorConfig = function( config )
{
  config.toolbar_CustomToolbar =
    [
      { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','-','Undo','Redo' ] },
      { name: 'insert', items : [ 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak'] },
      { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
      { name: 'links', items : [ 'Link','Unlink' ] },
      { name: 'tools', items : [ 'Maximize','-','About' ] },
      { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] }
    ];
}