# Install Matlab Jupyter kernel

PH, October 2019

## Install MATLAB API Engine for Python

In the **Anaconda Prompt**, run **as administrator**:

```
cd "matlabroot\extern\engines\python"
python setup.py install
```

where `matlabroot` is the MATLAB installation directory,
like `C:\Program Files\MATLAB\R2018b`.


## Install Matlab kernel

Install [imatlab](https://github.com/imatlab/imatlab) kernel:

```
pip install imatlab
```

Then, register the kernelspec with:
```
python -mimatlab install
```

cf. [imatlab README](https://github.com/imatlab/imatlab) for doc on configuration
for inline graphics

Alternative: Calysto's [matlab_kernel](https://github.com/Calysto/matlab_kernel)


## Patch

imatlab v0.4 has a bug https://github.com/imatlab/imatlab/issues/60
→ fixed in master on Nov 4, 2019

## References

* [Jupyter notebook for MATLAB](https://itchforphysics.wordpress.com/2018/09/13/jupyter-notebook-for-matlab/)
* [Install MATLAB Engine API for Python](https://fr.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html)
* [imatlab README](https://github.com/imatlab/imatlab)

