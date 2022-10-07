{
  container(containerName,imageRepository, imageTag)::
  {
    name: containerName,
    image:{
      repository: imageRepository,
      tag: imageTag,
    }
  }
}

