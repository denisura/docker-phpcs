docker-phpcs
============

Used to create Docker images for running PHP_CodeSniffer tools (phpcs/phpcbf).  http://pear.php.net/package/PHP_CodeSniffer 


Build
--------------------

Build from `Dockerfile`:

    ``` sh
    sudo docker build --no-cache -t denisura/phpcs .
    ```

Verify build:

    ``` sh
    sudo docker run --rm -it denisura/phpcs phpcs --version
    sudo docker run --rm -it denisura/phpcs phpcbf --version
    ```

Usage
--------------------

1. Install the `denisura/phpcs` container (optional - this step is performed by Docker automatically when running the container):

    ``` sh
    $ docker pull denisura/phpcs
    ```

2. Define an bash alias that runs this container whenever `composer` is invoked on the command line:

	``` sh
	$ echo "alias phpcs='docker run --rm -it -v \$(pwd):/workspace denisura/phpcs phpcs'" >> ~/.bashrc
	$ echo "alias phpcbf='docker run --rm -it -v \$(pwd):/workspace denisura/phpcs phpcbf'" >> ~/.bashrc
	$ source ~/.bashrc
	```

3. Run composer as always:

	``` sh
	$ phpcs --version
	```

	``` sh
	$ phpcbf --version
	```