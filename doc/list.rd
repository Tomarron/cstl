=begin
== list
list���g���ɂ́Alist.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/list.h>

�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

  /* �C���^�[�t�F�C�X��W�J */
  #define CSTL_LIST_INTERFACE(Name, Type)

  /* ������W�J */
  #define CSTL_LIST_IMPLEMENT(Name, Type)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AType�ɔC�ӂ̗v�f�̌^���w�肷��B
<<< br

CSTL_LIST_INTERFACE�̈�����Name��List, Type��T���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �^

  List
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

  ListIterator
�C�e���[�^�̌^�B�v�f�̈ʒu�������B
�폜���ꂽ�v�f�������C�e���[�^�͖����ƂȂ�B

==== �֐�
�ȉ��̊֐��ɂ����āAList*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  List *List_new(void);
* list�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void List_delete(List *self);
* self�̂��ׂĂ̗v�f���폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t List_size(List *self);
* self�̌��݂̗v�f����Ԃ��B
<<< br

  int List_empty(List *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ �C�e���[�^
  ListIterator List_begin(List *self);
* self�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  ListIterator List_end(List *self);
* self�̍Ō�̗v�f�̎��̃C�e���[�^��Ԃ��B
<<< br

  ListIterator List_rbegin(List *self);
* self�̍Ō�̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  ListIterator List_rend(List *self);
* self�̍ŏ��̗v�f�̑O�̃C�e���[�^��Ԃ��B
<<< br

  ListIterator List_next(ListIterator pos);
* pos�������ʒu�̗v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��List_end()�܂���List_rend()�łȂ����ƁB
<<< br

  ListIterator List_prev(ListIterator pos);
* pos�������ʒu�̗v�f�̑O�̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��List_end()�܂���List_rend()�łȂ����ƁB
<<< br

+ ���
  int List_assign(List *self, ListIterator first, ListIterator last);
* [first, last)�͈̗̔͂v�f�̃R�s�[��self�̗v�f�Ƃ��đ������B
* [first, last)�̗v�f��self�����v�f�ł��悢�B
* ����ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * [first, last)���L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  void List_swap(List *self, List *x);
* self��x�̓��e����������B
* �v�f�̃R�s�[�����Ȃ��̂ŁAList_assign(self, List_begin(x), List_end(x))���������B
  x���s�v�ɂȂ�ꍇ�A��������g�p����ׂ��ł���B
<<< br

+ �v�f�̃A�N�Z�X
  T *List_at(ListIterator pos);
* pos�������ʒu�̗v�f�ւ̃|�C���^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��List_end()�܂���List_rend()�łȂ����ƁB
<<< br

  T List_front(List *self);
* self�̍ŏ��̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  T List_back(List *self);
* self�̍Ō�̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

+ �}��
  ListIterator List_insert(List *self, ListIterator pos, T elem);
* self��pos�������ʒu��elem�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A�V�����v�f�̃C�e���[�^��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  int List_insert_n(List *self, ListIterator pos, size_t n, T elem);
* self��pos�������ʒu��elem�̃R�s�[��n�}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  int List_insert_array(List *self, ListIterator pos, T *elems, size_t n);
* self��pos�������ʒu��elems�Ƃ����z�񂩂�n�̗v�f�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * elems��NULL�łȂ����ƁB
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  int List_insert_range(List *self, ListIterator pos, ListIterator first, ListIterator last);
* self��pos�������ʒu��[first, last)�͈̗̔͂v�f�̃R�s�[��}������B
* [first, last)�̗v�f��self�����v�f�ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
  * [first, last)���L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  int List_push_back(List *self, T elem);
* elem�̃R�s�[��self�̍Ō�̗v�f�Ƃ��Ēǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  int List_push_front(List *self, T elem);
* elem�̃R�s�[��self�̍ŏ��̗v�f�Ƃ��Ēǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ �폜
  ListIterator List_erase(List *self, ListIterator pos);
* self��pos�������ʒu�̗v�f���폜���A���̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
  * pos��List_end()�܂���List_rend()�łȂ����ƁB
<<< br

  ListIterator List_erase_range(List *self, ListIterator first, ListIterator last);
* self��[first, last)�͈̗̔͂v�f���폜���A�폜�����v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * [first, last)��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  T List_pop_front(List *self);
* self�̍ŏ��̗v�f���폜���A���̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  T List_pop_back(List *self);
* self�̍Ō�̗v�f���폜���A���̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  void List_clear(List *self);
* self�̂��ׂĂ̗v�f���폜����B
<<< br

+ �T�C�Y�̕ύX
  int List_resize(List *self, size_t n, T elem);
* self�̗v�f����n�ɕύX����B
* n��self�̌��݂̗v�f���ȉ��̏ꍇ�A�v�f����n�ɂȂ�܂Ŗ�������v�f���폜�����B
* n��self�̌��݂̗v�f�����傫���ꍇ�A�v�f����n�ɂȂ�܂�elem�̃R�s�[����������ǉ������B
* �v�f���̕ύX�ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�A0��Ԃ��B
<<< br

+ �Ȃ��ւ�
  void List_splice(List *self, ListIterator pos, List *x, ListIterator first, ListIterator last);
* self��pos�������ʒu��x��[first, last)�͈̗̔͂v�f���ړ�����B
* [first, last)�̗v�f�̐�����self�̗v�f�����������Ax�̗v�f������������B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
  * [first, last)��x�̗L���ȃC�e���[�^�ł��邱�ƁB
  * self��x������Ȃ��pos��[first, last)�͈̔͊O�ł��邱�ƁB
<<< br

+ �\�[�g
  void List_sort(List *self, int (*comp)(const T *p1, const T *p2));
* self�̂��ׂĂ̗v�f���r�֐�comp�ɏ]���ă\�[�g����B
* comp�ɂ́A*p1 = *p2�Ȃ��0���A*p1 < *p2�Ȃ�ΐ��܂��͕��̐������A*p1 > *p2�Ȃ��*p1 < *p2�̏ꍇ�Ƌt�̕����̐�����Ԃ��֐����w�肷��B
* ���̃\�[�g�͈���ł���B
<<< br

+ ���בւ�
  void List_reverse(List *self);
* self�̂��ׂĂ̗v�f���t���ɕ��בւ���B
<<< br

+ �}�[�W
  void List_merge(List *self, List *x, int (*comp)(const T *p1, const T *p2));
* �\�[�g���ꂽ��Ԃł���self��x�ɂ����āAx�̂��ׂĂ̗v�f���r�֐�comp�ɏ]����self�Ƀ}�[�W����B
* self�̓\�[�g���ꂽ��ԂɂȂ�Ax�͋�ɂȂ�B
* comp�ɂ́A*p1 = *p2�Ȃ��0���A*p1 < *p2�Ȃ�ΐ��܂��͕��̐������A*p1 > *p2�Ȃ��*p1 < *p2�̏ꍇ�Ƌt�̕����̐�����Ԃ��֐����w�肷��B
* ���O����
  * self��x��comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

=end
