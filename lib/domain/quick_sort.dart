void quickSort(List<String> list, int leftIndex, int rightIndex) {
  if(leftIndex < rightIndex) {
    int partitionIndex = partition(list, leftIndex, rightIndex);
    quickSort(list, leftIndex, partitionIndex-1);
    quickSort(list, partitionIndex+1, rightIndex);
  }
}

int partition(List<String> list, int leftIndex, int rightIndex) {
  String pivot = list[rightIndex];
  int i = leftIndex -1;
  for(int j=leftIndex; j<rightIndex; j++){
    if(list[j].compareTo(pivot) < 0){
      i++;
      swap(list,i,j);
    }
  }

  swap(list, i+1, rightIndex);

  return i+1;
}

void swap(List<String> list, int i, int j) {
  String temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}