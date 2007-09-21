=begin
== set/multiset
set/multiset���g���ɂ́Aset.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/set.h>

�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

* set�̏ꍇ
    /* �C���^�[�t�F�C�X��W�J */
    #define CSTL_SET_INTERFACE(Name, Type)

    /* ������W�J */
    #define CSTL_SET_IMPLEMENT(Name, Type, Compare)

* multiset�̏ꍇ
    /* �C���^�[�t�F�C�X��W�J */
    #define CSTL_MULTISET_INTERFACE(Name, Type)

    /* ������W�J */
    #define CSTL_MULTISET_IMPLEMENT(Name, Type, Compare)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AType�ɔC�ӂ̗v�f�̌^���w�肷��B

Compare�ɗv�f�̔�r���[�`�����w�肷��B
  * Type�������^�A�����^�A�|�C���^�^�ȂǁA2�̒l��P���ɔ�r�ł���^�̏ꍇ�A
    �v�f�̃\�[�g�̏����������ɂ���Ȃ��CSTL_LESS�}�N�����A�~���ɂ���Ȃ��CSTL_GREATER�}�N�����w�肷��B
    CSTL_LESS/CSTL_GREATER�}�N���̓w�b�_�ňȉ��̂悤�ɒ�`����Ă���B
      #define CSTL_LESS(x, y)     ((x) == (y) ? 0 : (x) < (y) ? -1 : 1)
      #define CSTL_GREATER(x, y)  ((x) == (y) ? 0 : (x) > (y) ? -1 : 1)
  * Type�����̑��̌^�̏ꍇ�A�ȉ��̃v���g�^�C�v�̂悤�Ȉ����Ɩ߂�l�������A
    x = y�Ȃ��0���Ax < y�Ȃ�ΐ��܂��͕��̐������Ax > y�Ȃ��x < y�̏ꍇ�Ƌt�̕����̐�����
    �Ԃ���r���[�`�����w�肷��B
    ���AType��������^(char*)�Ȃ�΁AC�W���֐���strcmp���w��\�ł���B
      int Compare(Type x, Type y);

<<< br

CSTL_SET_INTERFACE/CSTL_MULTISET_INTERFACE�̈�����Name��Set, Type��T���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �^

  Set
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

  SetIterator
�C�e���[�^�̌^�B�v�f�̈ʒu�������B
�֐�����Ԃ��ꂽ�C�e���[�^��L���ȃC�e���[�^�Ƃ����B
�錾���ꂽ�����̃C�e���[�^�A�܂��͍폜���ꂽ�v�f�̃C�e���[�^�𖳌��ȃC�e���[�^�Ƃ����B

==== �֐�
�ȉ��̊֐��ɂ����āASet*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  Set *Set_new(void);
* set/multiset�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void Set_delete(Set *self);
* self�̂��ׂĂ̗v�f���폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t Set_size(Set *self);
* self�̌��݂̗v�f����Ԃ��B
<<< br

  int Set_empty(Set *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ �C�e���[�^
  SetIterator Set_begin(Set *self);
* self�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  SetIterator Set_end(Set *self);
* self�̍Ō�̗v�f�̎��̃C�e���[�^��Ԃ��B
<<< br

  SetIterator Set_rbegin(Set *self);
* self�̍Ō�̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  SetIterator Set_rend(Set *self);
* self�̍ŏ��̗v�f�̑O�̃C�e���[�^��Ԃ��B
<<< br

  SetIterator Set_next(SetIterator pos);
* pos�������ʒu�̗v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Set_end()�܂���Set_rend()�łȂ����ƁB
<<< br

  SetIterator Set_prev(SetIterator pos);
* pos�������ʒu�̗v�f�̑O�̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Set_end()�܂���Set_rend()�łȂ����ƁB
<<< br

+ �v�f�̃A�N�Z�X
  T Set_key(SetIterator pos);
* pos�������ʒu�̗v�f��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Set_end()�܂���Set_rend()�łȂ����ƁB
<<< br

+ �}��
  SetIterator Set_insert(Set *self, T elem, int *success);
* elem�̃R�s�[��self�ɑ}������B
* �}���ɐ��������ꍇ�A*success��0�ȊO�̒l���i�[���A�V�����v�f�̃C�e���[�^��Ԃ��B
* self������elem�Ƃ����v�f�������Ă���ꍇ�A�}�����s�킸�A*success��0���i�[���A���̗v�f�̃C�e���[�^��Ԃ��B
* �������s���̏ꍇ�A*success��0���i�[���Aself�̕ύX���s�킸0��Ԃ��B
* success��NULL���w�肵���ꍇ�A*success�ɃA�N�Z�X���Ȃ��B
* ���̊֐���set�݂̂Œ񋟂����B
<<< br

  SetIterator Set_insert(Set *self, T elem);
* elem�̃R�s�[��self�ɑ}������B
* �}���ɐ��������ꍇ�A�V�����v�f�̃C�e���[�^��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* self������elem�Ƃ����v�f�������Ă���ꍇ�A���̒l�̈�ԍŌ�̈ʒu�ɑ}�������B
* ���̊֐���multiset�݂̂Œ񋟂����B
<<< br

  int Set_insert_range(Set *self, SetIterator first, SetIterator last);
* [first, last)�͈̗̔͂v�f�̃R�s�[��self�ɑ}������B
* multiset�̏ꍇ�A[first, last)�̗v�f��self�����v�f�ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * [first, last)���L���ȃC�e���[�^�ł��邱�ƁB
<<< br

+ �폜
  SetIterator Set_erase(Set *self, SetIterator pos);
* self��pos�������ʒu�̗v�f���폜���A���̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Set_end()�܂���Set_rend()�łȂ����ƁB
<<< br

  SetIterator Set_erase_range(Set *self, SetIterator first, SetIterator last);
* self��[first, last)�͈̗̔͂v�f���폜���A�폜�����v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * [first, last)��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  size_t Set_erase_key(Set *self, T elem);
* self��elem�Ƃ����v�f�����ׂč폜���A�폜��������Ԃ��B
<<< br

  void Set_clear(Set *self);
* self�̂��ׂĂ̗v�f���폜����B
<<< br

+ ����
  void Set_swap(Set *self, Set *x);
* self��x�̓��e����������B
<<< br

+ ����
  size_t Set_count(Set *self, T elem);
* self��elem�Ƃ����v�f�̐���Ԃ��B
<<< br

  SetIterator Set_find(Set *self, T elem);
* self��elem�Ƃ����v�f���������A�ŏ��Ɍ��������v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Set_end(self)��Ԃ��B
<<< br

  SetIterator Set_lower_bound(Set *self, T elem);
* �\�[�g�̊�ɏ]���Aself��elem�ȏ�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Set_end(self)��Ԃ��B
<<< br

  SetIterator Set_upper_bound(Set *self, T elem);
* �\�[�g�̊�ɏ]���Aself��elem���傫���ŏ��̗v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Set_end(self)��Ԃ��B
<<< br

=end
