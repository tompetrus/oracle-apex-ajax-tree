function init_tree_custom(pOptions){
  apex.debug("init_tree_custom");
  /*
  treeRegionId : string with tree element id
  ajaxIdent    : plugin ajax identifier
  ajaxSearch   : boolean
  initData     : json array with data to instantiate tree with
  initLoaded   : 
  initOpen     : json array with nodes to open up
  initSelect   : node id to select
  selectedItem : html element item id of element to hold selected node id
  themetype    :
  theme        : 
  themeurl     : 
  */
  var lOptions = {
      "treeRegionId" : null
    , "ajaxIdent"    : null
    , "ajaxSearch"   : null
    , "initData"     : null
    , "initLoaded"   : null
    , "initOpen"     : null
    , "initSelect"   : null
    , "selectedItem" : null
    , "themetype"    : null
    , "theme"        : null
    , "themeurl"     : null
    };
  
  $.extend(lOptions, pOptions);
  
  lOptions.themetype = !!lOptions.themetype ? lOptions.themetype : 'themeroller';  
  
  if(lOptions.themetype !== "themeroller"){
    lOptions.theme = !!lOptions.theme ? lOptions.theme : 'default' ;
    lOptions.themeurl = !!lOptions.themeurl ? lOptions.themeurl : '' ; //this is actually required...
  };
  
  apex.debug("..Options: ");
  apex.debug(lOptions);
  
  var lTreeConfig = {
    "plugins" : ["json_data", "search", "ui"],
    "core" : {
      "load_open": true,
      "initially_open": []
    },
    "ui" : {
      "initially_select": [],
      "initially_load": [],
      "select_limit": 1
    },
    "json_data" : {
        "ajax" : {
            "type"           : 'POST',
            "url"            : "wwv_flow.show",
            "data": function(node){
                      return {
                        "p_request"      : "PLUGIN="+lOptions.ajaxIdent,
                        "p_flow_id"      : $v('pFlowId'),
                        "p_flow_step_id" : $v('pFlowStepId'),
                        "p_instance"     : $v('pInstance'),
                        "x01"            : "LOAD",
                        "x02"            : $(node).attr("id") || 0,
                        "x10"            : !!$("#pdebug").val() ? $("#pdebug").val() : 'NO'
                        };
            },
            "success": function (new_data) {
                return new_data;
            }
        }
    },
    "search":{
      "search_method": "jstree_contains"
    }
  };
  
  if(!!lOptions.themetype){
    if(lOptions.themetype == 'themeroller'){
      lTreeConfig.plugins.push("themeroller");
    }else if(lOptions.themetype == 'themes'){
      lTreeConfig.plugins.push("themes");
      
      var lThemeConfig = {"themes": {"theme":lOptions.theme,"url":lOptions.themeurl}};
      
      $.extend(lTreeConfig, lThemeConfig);      
    };
  };

  if(!!lOptions.initOpen){
    lTreeConfig.core.initially_open = lOptions.initOpen;
  };
  
  if(!!lOptions.initSelect){
    lTreeConfig.ui.initially_select = lOptions.initSelect;
  };
  
  if(!!lOptions.initLoaded){
    lTreeConfig.core.initially_load = lOptions.initLoaded;
  };
  
  if(!!lOptions.initData){
    $.extend(lTreeConfig.json_data,
    { "data" : lOptions.initData }
    );
  };
  
  if(lOptions.ajaxSearch){
    $.extend(lTreeConfig.search, 
      {
        "ajax" : {
              "type"           : 'POST',
              "url"            : "wwv_flow.show",
              "data": function(searchvalue){
                        return {
                          "p_request"      : "PLUGIN="+lOptions.ajaxIdent,
                          "p_flow_id"      : $v('pFlowId'),
                          "p_flow_step_id" : $v('pFlowStepId'),
                          "p_instance"     : $v('pInstance'),
                          "x01"            : "SEARCH",
                          "x02"            : searchvalue,
                          "x10"            : !!$("#pdebug").val() ? $("#pdebug").val() : 'NO'
                          };
              },
              "success": function (nodelist) {
                  return nodelist;
              }
        }
      }
    );
  };

 apex.debug(lTreeConfig);
  
 $("#"+lOptions.treeRegionId).jstree(lTreeConfig);
  
  if ( !!lOptions.selectedItem ) {
    $("#"+lOptions.treeRegionId).on("select_node.jstree", null, null, function(event, data){
      $s(lOptions.selectedItem, data.rslt.obj[0].id);
    });
  };
  
  $("#"+lOptions.treeRegionId).on("apexrefresh", null, null, function(){
    $("#"+lOptions.treeRegionId).jstree("refresh", -1);
  });
}