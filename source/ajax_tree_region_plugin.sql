PROCEDURE validate_region_sql(
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin )
IS
  l_data_type_list wwv_flow_global.vc_arr2;
  l_sql_handler    apex_plugin_util.t_sql_handler;
  l_sql            VARCHAR2(32767) := p_region.source;
BEGIN
  --level     : number
  --parent_id : number
  --node_id   : number
  --name      : varchar
  --isleaf    : number
  --path      : don't check - could be single node id --varchar?
  --link      : varchar
  --icon      : varchar
  l_data_type_list(1) := apex_plugin_util.c_data_type_number;
  l_data_type_list(2) := apex_plugin_util.c_data_type_number;
  l_data_type_list(3) := apex_plugin_util.c_data_type_number;
  l_data_type_list(4) := apex_plugin_util.c_data_type_varchar2;
  l_data_type_list(5) := apex_plugin_util.c_data_type_number;
  l_data_type_list(7) := apex_plugin_util.c_data_type_varchar2;
  l_data_type_list(8) := apex_plugin_util.c_data_type_varchar2;
  
  l_sql_handler := 
    apex_plugin_util.get_sql_handler(
      p_sql_statement   => l_sql
    , p_min_columns     => 8
    , p_max_columns     => 8
    , p_data_type_list  => l_data_type_list
    , p_component_name  => p_region.name);
    
  IF l_sql_handler.column_list(1).col_name != 'LEVEL' THEN
    --error
    RAISE_APPLICATION_ERROR(-20001, 'First column in SQL has to be level. Check the example SQL!');
  END IF;
    
  IF l_sql_handler.column_list(2).col_name != 'PARENT_ID' THEN
    --error
    RAISE_APPLICATION_ERROR(-20001, 'First column in SQL has to be "PARENT_ID". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(3).col_name != 'NODE_ID' THEN
    --error
    RAISE_APPLICATION_ERROR(-20002, 'Second column in SQL has to be "NODE_ID". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(4).col_name != 'NAME' THEN
    --error
    RAISE_APPLICATION_ERROR(-20003, 'Third column in SQL has to be "NAME". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(5).col_name != 'ISLEAF' THEN
    --error
    RAISE_APPLICATION_ERROR(-20004, 'Fourth column in SQL has to be "ISLEAF". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(6).col_name != 'NODE_PATH' THEN
    --error
    RAISE_APPLICATION_ERROR(-20005, 'Fifth column in SQL has to be "NODE_PATH". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(7).col_name != 'LINK' THEN
    --error
    RAISE_APPLICATION_ERROR(-20007, 'Seventh column in SQL has to be "LINK". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(8).col_name != 'ICON' THEN
    --error
    RAISE_APPLICATION_ERROR(-20008, 'Eight column in SQL has to be "ICON". Check the example SQL or alias the column accordingly');
  END IF;
  
  apex_plugin_util.free_sql_handler(l_sql_handler);
EXCEPTION WHEN OTHERS THEN
  apex_plugin_util.free_sql_handler(l_sql_handler);
  htp.p('validate_region_sql');
  RAISE;
END;
-----------------------------------------------------------------------
PROCEDURE validate_search_sql(
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin )
IS
  l_data_type_list    wwv_flow_global.vc_arr2;
  l_sql_handler apex_plugin_util.t_sql_handler;
  l_sql VARCHAR2(32767) := p_region.attribute_03;
BEGIN
  --level     : number
  --parent_id : number
  --node_id   : number
  --name      : varchar
  --node_path : varchar
  l_data_type_list(1) := apex_plugin_util.c_data_type_number; 
  l_data_type_list(2) := apex_plugin_util.c_data_type_number; 
  l_data_type_list(3) := apex_plugin_util.c_data_type_number;
  l_data_type_list(4) := apex_plugin_util.c_data_type_varchar2;
--  l_data_type_list(5) := apex_plugin_util.c_data_type_varchar2;  
  
  l_sql_handler := 
    apex_plugin_util.get_sql_handler(
      p_sql_statement   => l_sql
    , p_min_columns     => 5
    , p_max_columns     => 5
    , p_data_type_list  => l_data_type_list
    , p_component_name  => p_region.name);
    
  IF l_sql_handler.column_list(1).col_name != 'LEVEL' THEN
    --error
    RAISE_APPLICATION_ERROR(-20001, 'First column in SQL has to be "LEVEL". Check the example SQL or alias the column accordingly');
  END IF;
    
  IF l_sql_handler.column_list(2).col_name != 'PARENT_ID' THEN
    --error
    RAISE_APPLICATION_ERROR(-20002, 'Second column in SQL has to be "PARENT_ID". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(3).col_name != 'NODE_ID' THEN
    --error
    RAISE_APPLICATION_ERROR(-20003, 'Third column in SQL has to be "NODE_ID". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(4).col_name != 'NAME' THEN
    --error
    RAISE_APPLICATION_ERROR(-20004, 'Fourth column in SQL has to be "NAME". Check the example SQL or alias the column accordingly');
  END IF;
  
  IF l_sql_handler.column_list(5).col_name != 'NODE_PATH' THEN
    --error
    RAISE_APPLICATION_ERROR(-20005, 'Fifth column in SQL has to be "NODE_PATH". Check the example SQL or alias the column accordingly');
  END IF;
  
  apex_plugin_util.free_sql_handler(l_sql_handler);
EXCEPTION WHEN OTHERS THEN
  apex_plugin_util.free_sql_handler(l_sql_handler);
  htp.p('validate_search_sql');
  RAISE;
END;
-----------------------------------------------------------------------
PROCEDURE validate_opened_sql(
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin )
IS
  l_data_type_list    wwv_flow_global.vc_arr2;
  l_sql_handler apex_plugin_util.t_sql_handler;
  l_sql VARCHAR2(32767) := p_region.attribute_08;
BEGIN  
  l_sql_handler := 
    apex_plugin_util.get_sql_handler(
      p_sql_statement   => l_sql
    , p_min_columns     => 1
    , p_max_columns     => 1
    , p_data_type_list  => l_data_type_list
    , p_component_name  => p_region.name);
    
  IF l_sql_handler.column_list(1).col_name != 'NODE_ID' THEN
    --error
    RAISE_APPLICATION_ERROR(-20001, 'First column in SQL has to be "NODE_ID". Check the example SQL or alias the column accordingly');
  END IF;
  
  apex_plugin_util.free_sql_handler(l_sql_handler);
EXCEPTION WHEN OTHERS THEN
  apex_plugin_util.free_sql_handler(l_sql_handler);
  htp.p('validate_opened_sql');
  RAISE;
END;
-----------------------------------------------------------------------
FUNCTION get_unique_nodes_list
( p_region     IN apex_plugin.t_region
, p_node_sql   IN VARCHAR2
, p_bindlist   IN apex_plugin_util.t_bind_list
, p_build_from IN apex_application_global.vc_arr2 )
RETURN apex_application_global.vc_arr2
IS
  l_node_list      apex_plugin_util.t_column_value_list;
  l_path_list      apex_plugin_util.t_column_value_list;
  
  l_split_list     apex_application_global.vc_arr2;
  l_open_list      apex_application_global.vc_arr2;
  
  l_nodes          VARCHAR2(32767);
  l_found          BOOLEAN     := FALSE;
  l_sep            VARCHAR2(3) := '","';
BEGIN
  apex_debug.enter('get_unique_nodes_list' 
      , 'p_node_sql'           , p_node_sql
      , 'p_build_from(length)' , p_build_from.count
      );
  
  l_open_list := p_build_from;

  l_node_list :=
      apex_plugin_util.get_data (
          p_sql_statement    => p_node_sql,
          p_min_columns      => 1,
          p_max_columns      => 1,
          p_component_name   => NULL,
          p_search_type      => NULL,
          p_search_column_no => NULL,
          p_search_string    => NULL,
          p_auto_bind_items  => TRUE,
          p_bind_list        => p_bindlist);
  
  FOR i IN 1 .. l_node_list(1).COUNT
  LOOP
    -- retrieve the NODE_PATH through querying source sql
    -- COL NR 3 = NODE_ID
    -- COL NR 6 = NODE PATH
    l_path_list :=
        apex_plugin_util.get_data (
            p_sql_statement    => p_region.source,
            p_min_columns      => 8,
            p_max_columns      => 8,
            p_component_name   => NULL,
            p_search_type      => apex_plugin_util.c_search_lookup,
            p_search_column_no => 3,
            p_search_string    => l_node_list(1)(i));
            
    FOR j IN 1 .. l_path_list(1).COUNT --retrieved records matching the node id
    LOOP
      apex_debug.message('path list: '||LTRIM(l_path_list(6)(j),','));
      -- split the path and iterate over node_list
      l_split_list := apex_util.string_to_table(LTRIM(l_path_list(6)(j),','),',');
      -- dont put in doubles and put nodes in in the same order as they are in the node path  
      FOR k IN 1..l_split_list.COUNT --nodes from the node path
      LOOP
        l_found := FALSE; --reinit
        FOR m IN 1..l_open_list.COUNT --nodes already saved
        LOOP
          --htp.p('cur node: '||l_split_list(k)|| ' comp to: '||l_open_list(m));
          IF l_split_list(k) = l_open_list(m) THEN -- if the node from the path is already saved
            l_found := TRUE;
          END IF;
          EXIT WHEN l_found;
        END LOOP;
        
        IF NOT l_found THEN --node isnt in the list yet, add it
          l_open_list(NVL(l_open_list.last, 0) + 1) := l_split_list(k);
        END IF;
      END LOOP;
    END LOOP;    
  END LOOP;
  apex_debug.message('get_unique_nodes_list: list: '|| apex_util.table_to_string(l_open_list));
  RETURN l_open_list;
EXCEPTION WHEN OTHERS THEN
  htp.p('get_unique_nodes_list');
  RAISE;
END;
-----------------------------------------------------------------------
PROCEDURE node_json
( p_clob     IN OUT NOCOPY CLOB
, p_id       IN            NUMBER
, p_name     IN            VARCHAR2
, p_link     IN            VARCHAR2
, p_icon     IN            VARCHAR2
, p_state    IN            NUMBER
, p_children IN OUT NOCOPY CLOB )
IS
  l_clob CLOB;
BEGIN
  apex_debug.enter('node_json' 
      , 'p_clob(length)'     , dbms_lob.getlength(p_clob)
      , 'p_id'               , p_id
      , 'p_name'             , p_name
      , 'p_link'             , p_link
      , 'p_icon'             , p_icon
      , 'p_state'            , p_state
      , 'p_children(length)' , dbms_lob.getlength(p_children)
      );
  
  l_clob :='{"data":{"title":"'||p_name||'","attr":{"href":"'||NVL(p_link, '#')||'"}';
  IF p_icon IS NOT NULL THEN
    l_clob := l_clob || ',"icon":"'||p_icon||'"';
  END IF;
  l_clob :=    l_clob 
            || '}'
            || ',"attr":{"id":"'||p_id||'"}'
            || ',"state":"'||CASE p_state WHEN 0 THEN 'closed' ELSE 'leaf' END||'"';
            
  IF p_state = 0 AND dbms_lob.getlength(p_children)>0 THEN
    l_clob := l_clob || ',"children":';
    dbms_lob.append(l_clob, p_children);
  END IF;

  dbms_lob.append(l_clob, '}');
  dbms_lob.append(p_clob, l_clob);
EXCEPTION WHEN OTHERS THEN
  htp.p('Error in node_json');
  apex_debug.message('Error in NODE_JSON');
  RAISE;
END;
-----------------------------------------------------------------------
PROCEDURE get_json_data
( p_clob         IN OUT NOCOPY CLOB
, p_node_sql     IN            VARCHAR2
, p_where        IN            VARCHAR2
, p_bindlist     IN            apex_plugin_util.t_bind_list
, p_get_children IN            BOOLEAN DEFAULT TRUE
, p_max_depth    IN            NUMBER)
IS
  l_sql               VARCHAR2(32767) := p_node_sql;
  l_column_value_list apex_plugin_util.t_column_value_list;
  l_children          CLOB;
  l_bindlist          apex_plugin_util.t_bind_list;
BEGIN  
  apex_debug.enter('get_json_data' 
      , 'p_clob(length)'     , dbms_lob.getlength(p_clob)
      , 'p_node_sql'         , p_node_sql
      , 'p_where'            , p_where
      , 'p_bindlist(length)' , p_bindlist.count
      , 'p_get_children'     , apex_debug.tochar(p_get_children)
      , 'p_max_depth'        , p_max_depth
      );
      
  l_sql := 'SELECT "LEVEL", "PARENT_ID", "NODE_ID", "NAME", "ISLEAF", "LINK", "ICON" FROM ('||p_node_sql||')';
  l_sql := l_sql || ' WHERE ' || p_where;
  
  --level, parent id, node id, name, isleaf
  l_column_value_list :=
      apex_plugin_util.get_data (
          p_sql_statement    => l_sql,
          p_min_columns      => 7,
          p_max_columns      => 7,
          p_component_name   => NULL,
          p_search_type      => NULL,
          p_search_column_no => NULL,
          p_search_string    => NULL,
          p_auto_bind_items  => TRUE,
          p_bind_list        => p_bindlist);
            
  dbms_lob.append(p_clob, '[');
  FOR i IN 1 .. l_column_value_list(1).COUNT
  LOOP
    apex_debug.message('get_json_data: node: '||l_column_value_list(3)(i));
    
    dbms_lob.createtemporary(l_children, TRUE);
    
    IF     l_column_value_list(5)(i) = 0 
       AND p_get_children 
       AND p_max_depth >= l_column_value_list(1)(i)
    THEN      
      l_bindlist(1).name := 'NODE_SEARCH_VAL';
      l_bindlist(1).value := l_column_value_list(3)(i);
      
      apex_debug.message('get child nodes');
      get_json_data( p_clob      => l_children
                   , p_node_sql  => p_node_sql
                   , p_where     => '"PARENT_ID" = :NODE_SEARCH_VAL'
                   , p_bindlist  => l_bindlist
                   , p_max_depth => p_max_depth
                 );
    END IF;
    apex_debug.message('generate node json with child nodes');
    node_json( p_clob     => p_clob
             , p_id       => l_column_value_list(3)(i)
             , p_name     => l_column_value_list(4)(i)
             , p_link     => l_column_value_list(6)(i)
             , p_icon     => l_column_value_list(7)(i)
             , p_state    => l_column_value_list(5)(i)
             , p_children => l_children
             );
             
    dbms_lob.freetemporary(l_children);

    IF i != l_column_value_list(1).COUNT THEN
      dbms_lob.append(p_clob, ',');
    END IF;
  END LOOP;

  dbms_lob.append(p_clob, ']');
EXCEPTION WHEN OTHERS THEN
  htp.p('Error in json_data');
  htp.p(sqlerrm);
  apex_debug.message('Error in json_data');
  RAISE;
END;
-----------------------------------------------------------------------
PROCEDURE output_clob ( p_clob IN OUT NOCOPY CLOB )
IS
  l_size    NUMBER;
  l_read    INTEGER := 32767;
  l_offset  INTEGER :=1;
  l_buffer  VARCHAR2(32767);
BEGIN
   SELECT dbms_lob.getlength(p_clob) INTO l_size FROM dual;
   
   LOOP
     dbms_lob.read(p_clob, l_read, l_offset, l_buffer);
     l_offset := l_offset + l_read;
     htp.prn(l_buffer);
     EXIT WHEN l_offset >= l_size;
   END LOOP;
EXCEPTION WHEN OTHERS THEN
  htp.p('output_clob');
  RAISE;
END;
-----------------------------------------------------------------------
FUNCTION render_tree_region (
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin,
    p_is_printer_friendly IN BOOLEAN )
    RETURN apex_plugin.t_region_render_result
IS
  l_return           apex_plugin.t_region_render_result;
  l_region_id        VARCHAR2(100);  
  l_file_prefix      VARCHAR2(1000) := p_plugin.file_prefix;
  l_sql              VARCHAR2(32767);
  l_bindlist         apex_plugin_util.t_bind_list;
  l_empty_bindlist   apex_plugin_util.t_bind_list;
  l_output_clob      CLOB;
  
  /* ATTRIBUTE MAPPING */
  /*-------------------*/
  -- ajax search 
  l_sqlsearch_yn        VARCHAR2(1)     := p_region.attribute_01;
  l_sqlsearch_region    VARCHAR2(1)     := p_region.attribute_02;
                        
  -- partial payload    
  l_part_load_yn        VARCHAR2(1)     := p_region.attribute_05;
  l_part_load_lvl       NUMBER          := p_region.attribute_06;
  l_part_load_js_var    VARCHAR2(100);  
  l_part_load_static_yn VARCHAR2(1)     := p_region.attribute_12;
  l_part_load_nds       VARCHAR2(32767);
  l_part_load_sql       VARCHAR2(32767);
  l_part_load_list      apex_application_global.vc_arr2;
  
  --initial opened nodes
  l_init_open_yn        VARCHAR2(1)     := p_region.attribute_07;
  l_init_open_sql       VARCHAR2(32767) := p_region.attribute_08;
  l_init_open_list      apex_application_global.vc_arr2;
  l_init_open           VARCHAR2(32767);
  
  --initial selected node 
  l_init_select_yn      VARCHAR2(1)     := p_region.attribute_09;
  l_init_select_item    VARCHAR2(32767) := p_region.attribute_10;
  l_init_select_val     VARCHAR2(100);
  
  -- theme options, plugin level
  l_theme_type          VARCHAR2(50)    := p_plugin.attribute_01;
  l_jqui_version        VARCHAR2(50)    := p_plugin.attribute_02;
  l_jqui_theme          VARCHAR2(50)    := p_plugin.attribute_03;
  l_jqui_include_yn     VARCHAR2(1)     := p_plugin.attribute_06;
  l_std_theme           VARCHAR2(50)    := p_plugin.attribute_04;
  l_cst_theme_path      VARCHAR2(250)   := p_plugin.attribute_05;
  l_cst_theme_file      VARCHAR2(100)   := p_plugin.attribute_07;
BEGIN

  APEX_PLUGIN_UTIL.DEBUG_REGION ( 
    p_plugin, 
    p_region
  );
  
  -- This is the jstree v1.0.0 file pre jquery 1.8 compatibility
  apex_javascript.add_library (
    p_name      => 'jquery.jstree.pre1.8',
    p_directory => p_plugin.file_prefix,
    p_version   => NULL
  );

  -- Custom JS with tree initialisation
  -- TODO rename
  apex_javascript.add_library (
    p_name      => 'tree_plugin_js',
    p_directory => p_plugin.file_prefix,
    p_version   => NULL
  );
  
  -- validate region sql
  validate_region_sql(p_region => p_region, p_plugin => p_plugin);
  
  -- if ajax search enabled then validate that sql too
  IF l_sqlsearch_yn = 'Y' THEN
    IF l_sqlsearch_region != 'Y' THEN    
      validate_search_sql(p_region => p_region, p_plugin => p_plugin);
    END IF;
  END IF;
  
  -- generate region html
  l_region_id := COALESCE(p_region.static_id, TO_CHAR(p_region.id));
  
  -- OPEN REGION DIV
  htp.p('<div id="ct_'||l_region_id||'">');
  
  -- debug output
  apex_debug.message('ajax identifier: ' ||APEX_PLUGIN.GET_AJAX_IDENTIFIER);
  
  -- INIT PAYLOAD
  IF l_part_load_yn = 'Y' THEN
    IF l_part_load_static_yn = 'Y' THEN
      -- static load
      l_bindlist(1).name := 'TREE_LEVEL';
      l_bindlist(1).value := 1;

      apex_debug.message('create a temporary lob...');
      dbms_lob.createtemporary(l_output_clob, TRUE);
      
      apex_debug.message('get the json data');
      get_json_data( 
                     p_clob      => l_output_clob
                   , p_node_sql  => p_region.source
                   , p_where     => '"LEVEL" = :TREE_LEVEL'
                   , p_bindlist  => l_bindlist
                   , p_max_depth => l_part_load_lvl
                 );
                 
      --save the initial load in a global scope variable in script tags
      --store the name of the var and pass it on to the tree init code
      htp.p('<script type="text/javascript">');
      l_part_load_js_var := 'g_ct_'||l_region_id;
      htp.prn('var '||l_part_load_js_var||' = ' );
      apex_debug.message('output of the json data / LOB');
      output_clob(p_clob => l_output_clob);
      htp.prn(';');
      htp.p('</script>');
    ELSE
      -- ajax load       
      l_bindlist(1).name := 'TREE_LEVEL';
      l_bindlist(1).value := l_part_load_lvl + 1;
      
      l_part_load_sql := 'SELECT NODE_ID FROM ('||p_region.source||') WHERE "LEVEL" <= :TREE_LEVEL';
      l_part_load_list := get_unique_nodes_list( p_region     => p_region
                                               , p_node_sql   => l_part_load_sql
                                               , p_bindlist  => l_bindlist
                                               , p_build_from => l_part_load_list );
                                               
      -- transform array with all qualified nodes to a json array object formatted string
      l_part_load_nds := apex_util.table_to_string(l_part_load_list, '","');
      l_part_load_nds := '["'||l_part_load_nds||'"]';
    END IF;
  END IF;
  
  -- CLOSE REGION DIV
  htp.p('</div>');
  
  -- INITIAL SELECT
  IF l_init_select_yn = 'Y' THEN
    l_init_select_val := sys.htf.escape_sc(apex_util.get_session_state(l_init_select_item));
    IF l_init_select_val IS NOT NULL THEN
      -- if an initial selected node is set then that node has to be visible
      -- thus it needs to be added to the list of nodes to be opened
      l_init_open_list := get_unique_nodes_list( p_region     => p_region
                                               , p_node_sql   => 'SELECT '||l_init_select_val||' NODE_ID FROM DUAL'
                                               , p_bindlist  => l_empty_bindlist
                                               , p_build_from => l_init_open_list );
    END IF;
  END IF;
  
  -- VALIDATE OPENED SQL + GENERATE
  IF l_init_open_yn = 'Y' OR l_init_select_val IS NOT NULL THEN
    IF l_init_open_yn = 'Y' THEN
      validate_opened_sql(p_region => p_region, p_plugin => p_plugin);
      
      --output to script tags so tree can be initialized with it
      apex_debug.message('init open sql: '||l_init_open_sql);
      l_init_open_list := get_unique_nodes_list( p_region     => p_region
                                               , p_node_sql   => l_init_open_sql
                                               , p_bindlist  => l_empty_bindlist
                                               , p_build_from => l_init_open_list );
    END IF;
    
    -- transform array with all qualified nodes to a json array object formatted string
    l_init_open := apex_util.table_to_string(l_init_open_list, '","');
    l_init_open := '["'||l_init_open||'"]';
  END IF;
  
  -- THEMING
  IF l_theme_type = 'JQUERYUI' THEN
    -- TODO ADD JQUI LIB
    
    IF l_jqui_include_yn = 'Y' THEN
      apex_css.add_file (
        p_name      => 'libraries/jquery-ui/'||l_jqui_version||'/themes/'||l_jqui_theme||'/jquery-ui',
        p_directory => apex_application.g_image_prefix,
        p_version   => NULL
      );
    END IF;
    
    apex_css.add(
      p_css => 
        '#ct_'||l_region_id||' ins{background-color: transparent;} ' ||
        'div.jstree li > a.jstree-search{background: #CCCCCC;} ' ||
        '.jstree li,  ' ||
        'div.jstree li > ins.jstree-icon ' ||
        ' { background-image:url("'||l_file_prefix||'tree_icon_map-default.png"); background-repeat:no-repeat; background-color:transparent; } ' ||
        '.jstree li { background-position:-90px 0; background-repeat:repeat-y; } ' ||
        '.jstree li.jstree-last { background:transparent; } ' ||
        '.jstree .jstree-open > ins { background-position:-72px 0; } ' ||
        '.jstree .jstree-closed > ins { background-position:-54px 0; } ' ||
        '.jstree .jstree-leaf > ins { background-position:-36px 0; } ' ||
        '.jstree a.jstree-loading .jstree-icon { background:url("'||l_file_prefix||'throbber.gif") center center no-repeat !important; }',
      p_key => 'tree_plugin_css'
    );
  ELSIF l_theme_type = 'STANDARD' THEN
    CASE l_std_theme
    WHEN 'APPLE' THEN
      apex_css.add_file (
        p_name      => 'style-apple',
        p_directory => p_plugin.file_prefix,
        p_version   => NULL
      );
  
      apex_css.add(
          p_css => 
               '.jstree-apple > ul { background:url("'||l_file_prefix||'bg_apple.jpg") left top repeat; } '
            || '.jstree-apple li, .jstree-apple ins { background-image:url("'||l_file_prefix||'tree_icon_map-apple.png"); } '
            || '.jstree-classic a.jstree-loading .jstree-icon { background:url("'||l_file_prefix||'throbber.gif") center center no-repeat !important; } '
            || '.jstree-apple a.jstree-loading .jstree-icon { background:url("'||l_file_prefix||'throbber.gif") center center no-repeat !important; } '
            || '#vakata-dragged.jstree-apple .jstree-ok { background:url("'||l_file_prefix||'tree_icon_map-apple.png") -2px -53px no-repeat !important; } '
            || '#vakata-dragged.jstree-apple .jstree-invalid { background:url("'||l_file_prefix||'tree_icon_map-apple.png") -18px -53px no-repeat !important; } '
            || '#jstree-marker.jstree-apple { background:url("'||l_file_prefix||'tree_icon_map-apple.png") -41px -57px no-repeat !important; } '
        , p_key => 'tree_plugin_css'
      );
    WHEN 'CLASSIC' THEN
      apex_css.add_file (
        p_name      => 'style-classic',
        p_directory => p_plugin.file_prefix,
        p_version   => NULL
      );
      
      apex_css.add(
          p_css => 
               '.jstree-classic li, .jstree-classic ins { background-image:url("'||l_file_prefix||'tree_icon_map-classic.png"); } '
            || '.jstree-classic a.jstree-loading .jstree-icon { background:url("'||l_file_prefix||'throbber.gif") center center no-repeat !important; } '
            || '#vakata-dragged.jstree-classic .jstree-ok { background:url("'||l_file_prefix||'tree_icon_map-classic.png") -2px -53px no-repeat !important; } '
            || '#vakata-dragged.jstree-classic .jstree-invalid { background:url("'||l_file_prefix||'tree_icon_map-classic.png") -18px -53px no-repeat !important; } '
            || '#jstree-marker.jstree-classic { background:url("'||l_file_prefix||'tree_icon_map-classic.png") -41px -57px no-repeat !important; } '
        , p_key => 'tree_plugin_css'
      );
    WHEN 'DEFAULT' THEN
      apex_css.add_file (
        p_name      => 'style-default',
        p_directory => p_plugin.file_prefix,
        p_version   => NULL
      );
      
      apex_css.add(
          p_css => 
               '.jstree-default li, .jstree-default ins { background-image:url("'||l_file_prefix||'tree_icon_map-default.png"); } '
            || '.jstree-default a.jstree-loading .jstree-icon { background:url("'||l_file_prefix||'throbber.gif") center center no-repeat !important; } '
            || '#vakata-dragged.jstree-default .jstree-ok { background:url("'||l_file_prefix||'tree_icon_map-default.png") -2px -53px no-repeat !important; } '
            || '#vakata-dragged.jstree-default .jstree-invalid { background:url("'||l_file_prefix||'tree_icon_map-default.png") -18px -53px no-repeat !important; } '
            || '#jstree-marker.jstree-default { background:url("'||l_file_prefix||'tree_icon_map-default.png") -41px -57px no-repeat !important; } '
        , p_key => 'tree_plugin_css'
      );
    WHEN 'CUSTOM' THEN
      apex_css.add_file (
        p_name      => l_cst_theme_file,
        p_directory => l_cst_theme_path,
        p_version   => NULL
      );
    END CASE;
  END IF;
  
  -- Javascript initialization
  -- TODO: create jquery wrapper and pass options in an options object instead of literals
  apex_javascript.add_onload_code (
    'init_tree_custom({'
      ||   '  "treeRegionId" : "' || sys.htf.escape_sc('ct_'||l_region_id) ||'"'
      ||   ', "ajaxIdent" : "'    || APEX_PLUGIN.GET_AJAX_IDENTIFIER ||'"'
      ||   ', "ajaxSearch" :  '   || CASE l_sqlsearch_yn WHEN 'Y' THEN 'true' ELSE 'false' END
      ||   ', "initData" :  '     || NVL(l_part_load_js_var, 'null')
      ||   ', "initLoaded" : '    || NVL(l_part_load_nds, 'null')
      ||   ', "initOpen" :  '     || NVL(l_init_open, 'null') 
      ||   ', "initSelect" :  '   || NVL(l_init_select_val, 'null') 
      ||   ', "selectedItem" : "' || NVL(l_init_select_item, 'null') ||'"'
      ||   ', "themetype" : "'    || CASE l_theme_type WHEN 'STANDARD' THEN 'themes' ELSE 'themeroller' END ||'"'
      ||   ', "theme" : "'        || LOWER(l_std_theme) ||'"'
      ||   ', "themeurl" : "'     || p_plugin.file_prefix || 'style-' || LOWER(l_std_theme) ||'.css"'
      || '});'
  );
  
  RETURN l_return;
EXCEPTION WHEN OTHERS THEN
  htp.p('Error occured during the rendering of the region:');
  htp.p(sqlerrm);
  RETURN l_return;
END;
-----------------------------------------------------------------------
FUNCTION ajax_tree_region (
    p_region              IN apex_plugin.t_region,
    p_plugin              IN apex_plugin.t_plugin )
RETURN apex_plugin.t_region_ajax_result
IS
  l_return            apex_plugin.t_region_ajax_result;
  l_action            VARCHAR2(20)    := apex_application.g_x01;
  l_search_val        VARCHAR2(100)   := apex_application.g_x02;
  l_sqlsearch_yn      VARCHAR2(1)     := p_region.attribute_01;
  l_sqlsearch_region  VARCHAR2(1)     := p_region.attribute_02;
  l_search_stmt       VARCHAR2(32767) := p_region.attribute_03;
  l_search_type       VARCHAR2(32767) := p_region.attribute_11;  
  l_debug             VARCHAR2(5)     := apex_application.g_x10;
  
  l_sql               VARCHAR2(32767);
  l_bindvar           apex_plugin_util.t_bind;
  l_bindlist          apex_plugin_util.t_bind_list;
  l_column_value_list apex_plugin_util.t_column_value_list;
  l_output            CLOB;
BEGIN
  IF l_debug <> 'NO' THEN
    apex_debug.enable;
  END IF;
  
  apex_debug.message('ajax_tree_region');
  apex_debug.message('ACTION: '||l_action);

  -- parse sql statement afhankelijk van type ajax call. fetch of search
  IF l_action = 'LOAD' THEN
    apex_debug.message('search value: '||l_search_val);
    
    l_bindlist(1).name := 'NODE_SEARCH_VAL';
    l_bindlist(1).value := l_search_val;

    dbms_lob.createtemporary(l_output, TRUE);
    get_json_data
      ( p_clob         => l_output
      , p_node_sql     => p_region.source
      , p_where        => '"PARENT_ID" = :NODE_SEARCH_VAL'
      , p_bindlist     => l_bindlist
      , p_get_children => FALSE
      , p_max_depth    => 1);
    
    output_clob(l_output);
    
    dbms_lob.freetemporary(l_output);

  ELSIF l_action = 'SEARCH' AND l_sqlsearch_yn = 'Y' THEN
    apex_debug.message('search region? '||l_sqlsearch_region);
    apex_debug.message('search type: '||l_search_type);    
    
    IF l_sqlsearch_region = 'Y' THEN
      l_search_stmt := p_region.source;
    END IF;
  
    l_sql := 'SELECT  "LEVEL", PARENT_ID, NODE_ID, NAME, NODE_PATH'
           ||'  FROM ( ' || l_search_stmt || ' ) ' 
           ;
    
    l_search_val := apex_plugin_util.get_search_string(
        p_search_type   => l_search_type,
        p_search_string => l_search_val 
      );
      
    apex_debug.message('search value: '||l_search_val);
          
    --parent id, node id, name, is leaf
    l_column_value_list :=
        apex_plugin_util.get_data (
            p_sql_statement    => l_sql,
            p_min_columns      => 5,
            p_max_columns      => 5,
            p_component_name   => p_region.name,
            p_search_type      => l_search_type,
            p_search_column_no => 4,
            p_search_string    => l_search_val);
              
    htp.prn('[');
    FOR I IN 1 .. l_column_value_list(1).COUNT
    LOOP     
       htp.p('"#'||replace(ltrim(l_column_value_list(5)(i),','),',','","#')||'"');
      IF i != l_column_value_list(1).COUNT THEN
        htp.p(',');
      END IF;
    END LOOP;
    htp.prn(']');
  END IF;
  
  RETURN l_return;
END;