# benchsort

This is a tool for benchmarking the performance of different sorting algorithms. It is written in C and provides a command-line interface for specifying the input size and the algorithms to be compared. It was made for a university project.

## Demo

![Demo of benchsort](https://github.com/luizvilasboas/benchsort/blob/main/img/demo.png?raw=true)

## Usage

Below is how you can use benchsort. Feel free to fork or copy them, but be aware of the limitations that this repository license implies.

You can use the following options to use benchsort:

1. [Run in your machine](#run-in-your-machine)
2. [Run in a Docker container](#run-in-a-docker-container)

### Run in your machine

#### Clone the repo

To run benchsort, you must clone this repository with the following command:

```
git clone https://github.com/luizvilasboas/benchsort.git
```

#### Enter the cloned repository

After cloning, you must enter the local repository using the following command:

```
cd benchsort
```

#### Use GNU Make to compile the project

Install [GNU Make](https://gnu.org/software/make) on your system and run it with the command bellow:

```
make
```

#### Run the project

Finally use the command below to run the project:

```
./bin/benchsort
```

### Run in a Docker container

#### Clone the repo

To run the program in a docker container, clone the repository to your machine first:

```
git clone https://github.com/luizvilasboas/benchsort.git
```

#### Enter the cloned repository

After cloning, you must enter the local repository using the following command:

```
cd benchsort
```

#### Build the docker image

Then, use the command below to build the Docker image:

```
docker build -t olooeez/benchsort:latest .
```

#### Run the image in a container

Then, to run the image in a container, use the following command:

```
docker run -it --rm olooeez/benchsort:latest
```

## Contributing

If you would like to contribute to this project, please feel free to open a merge request. All contributions are welcome!

## License

This project is licensed under the [MIT](https://github.com/luizvilasboas/benchsort/blob/main/LICENSE) License. See the LICENSE file for details.
