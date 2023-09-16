sealed class EditMode {}

class Normal extends EditMode {}
class Have extends EditMode {}
class Wish extends EditMode {}

sealed class ViewMode {}

class ListViewMode extends ViewMode {}
class GridListViewMode extends ViewMode {}

sealed class DataType {}

class NendoroidData extends DataType {}
class NendoroidDollData extends DataType {}