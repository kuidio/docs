import os
import shutil

def on_post_build(config, **kwargs):
    site_dir = config['site_dir']
    artifactsDir = os.path.join(site_dir, 'artifacts')

    # make sure the artifacts folder exists in the webroot
    if not os.path.exists(artifactsDir):
        os.makedirs(artifactsDir)

    ### Install
    install_dir = os.path.join(artifactsDir,"install")
    os.makedirs(install_dir)
        
    # copy the kform generated artifacts.yaml
    shutil.copy('kuidr-repo/artifacts/out/artifacts.yaml', os.path.join(install_dir, 'install.yaml'))