from django.db import models

class Video(models.Model):
    title = models.CharField(max_length=255)
    video_file = models.FileField(upload_to='videos/')
    minutes = models.PositiveIntegerField(default=45)
    year_of_release = models.PositiveIntegerField(default=2020)
    cover_image = models.ImageField(upload_to='covers/' ,null=True)
    description = models.TextField(null=True,blank=True)
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
