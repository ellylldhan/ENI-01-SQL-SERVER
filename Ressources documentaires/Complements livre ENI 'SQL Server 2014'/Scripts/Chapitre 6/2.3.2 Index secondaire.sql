
CREATE XML INDEX idx_page_path ON CATALOGUES(page)
  USING XML INDEX pidx_page FOR PATH;

CREATE XML INDEX idx_page_property ON CATALOGUES(page)
  USING XML INDEX pidx_page FOR PROPERTY;

CREATE XML INDEX idx_page_value ON CATALOGUES(page)
  USING XML INDEX pidx_page FOR VALUE;