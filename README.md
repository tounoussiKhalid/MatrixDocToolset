# MatrixDocToolset

Welcome to the `MatrixDocToolset` repository! This project is a two-part toolset working with sparse matrices and those looking to document Pharo packages in a JavaDoc-like manner. Whether you're dealing with efficient matrix representations or you need detailed documentation for your Pharo classes, `MatrixDocToolset` has something to offer.

## Features

- **Sparse Matrix Encoder/Decoder**: Convert traditional matrices (arrays of arrays) into sparse matrix representations and vice versa. This part of the toolset is perfect for applications where matrices are large but contain few non-zero elements, allowing for more efficient storage and processing.

- **Pharo Class Documentation Generator**: Automatically generate detailed documentation for classes in a Pharo package. For each class, the tool provides information on its superclass, subclasses, instance variables, methods, and, uniquely, which methods reference each instance variable and which methods call each method (senders).

## Getting Started

To get started with `MatrixDocToolset`, clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/MatrixDocToolset.git
cd MatrixDocToolset
```

### Using the Sparse Matrix Encoder/Decoder

1. Navigate to the `SparseMatrixEncoder` package.
2. Open the tool according to your system's method for running Pharo projects.
3. Use the provided functions to convert matrices between traditional and sparse formats.

### Generating Pharo Class Documentation

1. Navigate to the `DocGenerator` package.
2. Open the project in your Pharo environment.
3. Load the package you wish to document, and run the documentation generator to produce JavaDoc-like documentation for your classes.
