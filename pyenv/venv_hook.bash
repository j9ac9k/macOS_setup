after_virtualenv "BASE_VERSION=\"$(echo $VIRTUALENV_NAME | awk -F/ '{print $(NF-2)}')\""
after_virtualenv "VENVNAME=\"$(echo $VIRTUALENV_NAME | awk -F/ '{print $(NF)}')\""
after_virtualenv 'CONDA=${PYENV_ROOT}/versions/${BASE_VERSION}/bin/conda'
after_virtualenv 'ACTIVATE=${PYENV_ROOT}/versions/${BASE_VERSION}/bin/activate'

after_virtualenv 'if [[ $BASE_VERSION = *"conda"* ]]; then echo "...linking conda and activate"; fi'
after_virtualenv 'if [[ $BASE_VERSION = *"conda"* ]]; then ln -s ${CONDA} ${PYENV_ROOT}/versions/${VENVNAME}/bin/; fi'
after_virtualenv 'if [[ $BASE_VERSION = *"conda"* ]]; then ln -s ${ACTIVATE} ${PYENV_ROOT}/versions/${VENVNAME}/bin/; fi'