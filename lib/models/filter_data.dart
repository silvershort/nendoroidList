class FilterData {
  bool haveFilter;
  bool notHaveFilter;
  bool wishFilter;
  bool expectedFilter;
  bool femaleFilter;
  bool maleFilter;
  bool etcFilter;

  bool noFilter() {
    return !haveFilter
        && !notHaveFilter
        && !wishFilter
        && !expectedFilter
        && !femaleFilter
        && !maleFilter
        && !etcFilter;
  }

  FilterData({
    this.haveFilter = false,
    this.notHaveFilter = false,
    this.wishFilter = false,
    this.expectedFilter = false,
    this.femaleFilter = false,
    this.maleFilter = false,
    this.etcFilter = false,
  });
}
