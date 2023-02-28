
void mergeSort(List<String> list, int leftIndex, int rightIndex) {
  if(leftIndex < rightIndex){
    int middleIndex = (leftIndex + rightIndex) ~/2;
    mergeSort(list, leftIndex, middleIndex);
    mergeSort(list, middleIndex + 1, rightIndex);
    merge(list, leftIndex, middleIndex, rightIndex);
  }
}

void merge(List<String> list, int leftIndex, int middleIndex, int rightIndex) {
  List<String> tempArr = List<String>.from(list);

  int i = leftIndex;
  int j = middleIndex +1;
  int k = leftIndex;

  while(i<=middleIndex && j<= rightIndex) {
    if(tempArr[i].compareTo(tempArr[j]) <=0 ) {
      list[k++] = tempArr[i++];
    }
    else{
      list[k++] = tempArr[j++];
    }
  }

  while( i<= middleIndex ){
    list[k++] = tempArr[i++];
  }
}