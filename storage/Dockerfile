FROM debian:jessie
RUN useradd www-data
RUN chown -R www-data:www-data /data
USER www-data
CMD ["ls -lh /data"]