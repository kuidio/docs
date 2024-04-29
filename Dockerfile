FROM squidfunk/mkdocs-material:$MKDOCS_MATERIAL_VER

# Install the Mermaid plugin
RUN pip install mkdocs-mermaid2-plugin