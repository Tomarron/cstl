=begin
== map/multimap
map/multimap���g���ɂ́Amap.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/map.h>

�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

* map�̏ꍇ
    /* �C���^�[�t�F�C�X��W�J */
    #define CSTL_MAP_INTERFACE(Name, KeyType, ValueType)

    /* ������W�J */
    #define CSTL_MAP_IMPLEMENT(Name, KeyType, ValueType, Compare)

* multimap�̏ꍇ
    /* �C���^�[�t�F�C�X��W�J */
    #define CSTL_MULTIMAP_INTERFACE(Name, KeyType, ValueType)

    /* ������W�J */
    #define CSTL_MULTIMAP_IMPLEMENT(Name, KeyType, ValueType, Compare)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AKeyType�ɔC�ӂ̗v�f�̃L�[�̌^���AValueType�ɔC�ӂ̗v�f�̒l�̌^���w�肷��B

Compare�ɗv�f�̔�r���[�`�����w�肷��B
  * KeyType�������^�A�����^�A�|�C���^�^�ȂǁA2�̒l��P���ɔ�r�ł���^�̏ꍇ�A
    �v�f�̃\�[�g�̏����������ɂ���Ȃ��CSTL_LESS�}�N�����A�~���ɂ���Ȃ��CSTL_GREATER�}�N�����w�肷��B
    CSTL_LESS/CSTL_GREATER�}�N���̓w�b�_�ňȉ��̂悤�ɒ�`����Ă���B
      #define CSTL_LESS(x, y)     ((x) == (y) ? 0 : (x) < (y) ? -1 : 1)
      #define CSTL_GREATER(x, y)  ((x) == (y) ? 0 : (x) > (y) ? -1 : 1)
  * KeyType�����̑��̌^�̏ꍇ�A�ȉ��̃v���g�^�C�v�̂悤�Ȉ����Ɩ߂�l�������A
    x = y�Ȃ��0���Ax < y�Ȃ�ΐ��܂��͕��̐������Ax > y�Ȃ��x < y�̏ꍇ�Ƌt�̕����̐�����
    �Ԃ���r���[�`�����w�肷��B
    ���AKeyType��������^(char*)�Ȃ�΁AC�W���֐���strcmp���w��\�ł���B
      int Compare(KeyType x, KeyType y);

<<< br

CSTL_MAP_INTERFACE/CSTL_MULTIMAP_INTERFACE�̈�����Name��Map, KeyType��KeyT, ValueType��ValueT���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �^

  Map
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

  MapIterator
�C�e���[�^�̌^�B�v�f�̈ʒu�������B
�֐�����Ԃ��ꂽ�C�e���[�^��L���ȃC�e���[�^�Ƃ����B
�錾���ꂽ�����̃C�e���[�^�A�܂��͍폜���ꂽ�v�f�̃C�e���[�^�𖳌��ȃC�e���[�^�Ƃ����B

==== �֐�
�ȉ��̊֐��ɂ����āAMap*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  Map *Map_new(void);
* map/multimap�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void Map_delete(Map *self);
* self�̂��ׂĂ̗v�f���폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t Map_size(Map *self);
* self�̌��݂̗v�f����Ԃ��B
<<< br

  int Map_empty(Map *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ �C�e���[�^
  MapIterator Map_begin(Map *self);
* self�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  MapIterator Map_end(Map *self);
* self�̍Ō�̗v�f�̎��̃C�e���[�^��Ԃ��B
<<< br

  MapIterator Map_rbegin(Map *self);
* self�̍Ō�̗v�f�̃C�e���[�^��Ԃ��B
<<< br

  MapIterator Map_rend(Map *self);
* self�̍ŏ��̗v�f�̑O�̃C�e���[�^��Ԃ��B
<<< br

  MapIterator Map_next(MapIterator pos);
* pos�������ʒu�̗v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Map_end()�܂���Map_rend()�łȂ����ƁB
<<< br

  MapIterator Map_prev(MapIterator pos);
* pos�������ʒu�̗v�f�̑O�̃C�e���[�^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Map_end()�܂���Map_rend()�łȂ����ƁB
<<< br

+ �v�f�̃A�N�Z�X
  KeyT Map_key(MapIterator pos);
* pos�������ʒu�̗v�f�̃L�[��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Map_end()�܂���Map_rend()�łȂ����ƁB
<<< br

  ValueT *Map_value(MapIterator pos);
* pos�������ʒu�̗v�f�̒l�ւ̃|�C���^��Ԃ��B
* ���O����
  * pos���L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Map_end()�܂���Map_rend()�łȂ����ƁB
<<< br

  ValueT *Map_lookup(Map *self, KeyT key);
* self��key�Ƃ����L�[�̗v�f�̒l�ւ̃|�C���^��Ԃ��B
* self��key�Ƃ����L�[�̗v�f�������Ă��Ȃ��ꍇ�Akey�Ƃ����L�[�̐V�����v�f(�l�͕s��)��}�����A���̗v�f�̒l�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANDEBUG�}�N��������`�Ȃ�΃A�T�[�V�����Ɏ��s���A��`�ς݂Ȃ��self�̕ύX���s�킸NULL��Ԃ��B
* ���̊֐���map�݂̂Œ񋟂����B
<<< br

+ �}��
  MapIterator Map_insert(Map *self, KeyT key, ValueT value, int *success);
* key��value�̃R�s�[�̃y�A��v�f�Ƃ���self�ɑ}������B
* �}���ɐ��������ꍇ�A*success��0�ȊO�̒l���i�[���A�V�����v�f�̃C�e���[�^��Ԃ��B
* self������key�Ƃ����L�[�̗v�f�������Ă���ꍇ�A�}�����s�킸�A*success��0���i�[���A���̗v�f�̃C�e���[�^��Ԃ��B
* �������s���̏ꍇ�A*success��0���i�[���Aself�̕ύX���s�킸0��Ԃ��B
* success��NULL���w�肵���ꍇ�A*success�ɃA�N�Z�X���Ȃ��B
* ���̊֐���map�݂̂Œ񋟂����B
<<< br

  MapIterator Map_insert(Map *self, KeyT key, ValueT value);
* key��value�̃R�s�[�̃y�A��v�f�Ƃ���self�ɑ}������B
* �}���ɐ��������ꍇ�A�V�����v�f�̃C�e���[�^��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* self������key�Ƃ����L�[�̗v�f�������Ă���ꍇ�A���̃L�[�̈�ԍŌ�̈ʒu�ɑ}�������B
* ���̊֐���multimap�݂̂Œ񋟂����B
<<< br

  int Map_insert_range(Map *self, MapIterator first, MapIterator last);
* [first, last)�͈̗̔͂v�f�̃R�s�[��self�ɑ}������B
* multimap�̏ꍇ�A[first, last)�̗v�f��self�����v�f�ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * [first, last)���L���ȃC�e���[�^�ł��邱�ƁB
<<< br

+ �폜
  MapIterator Map_erase(Map *self, MapIterator pos);
* self��pos�������ʒu�̗v�f���폜���A���̎��̃C�e���[�^��Ԃ��B
* ���O����
  * pos��self�̗L���ȃC�e���[�^�ł��邱�ƁB
  * pos��Map_end()�܂���Map_rend()�łȂ����ƁB
<<< br

  MapIterator Map_erase_range(Map *self, MapIterator first, MapIterator last);
* self��[first, last)�͈̗̔͂v�f���폜���A�폜�����v�f�̎��̃C�e���[�^��Ԃ��B
* ���O����
  * [first, last)��self�̗L���ȃC�e���[�^�ł��邱�ƁB
<<< br

  size_t Map_erase_key(Map *self, KeyT key);
* self��key�Ƃ����L�[�̗v�f�����ׂč폜���A�폜��������Ԃ��B
<<< br

  void Map_clear(Map *self);
* self�̂��ׂĂ̗v�f���폜����B
<<< br

+ ����
  void Map_swap(Map *self, Map *x);
* self��x�̓��e����������B
<<< br

+ ����
  size_t Map_count(Map *self, KeyT key);
* self��key�Ƃ����L�[�̗v�f�̐���Ԃ��B
<<< br

  MapIterator Map_find(Map *self, KeyT key);
* self��key�Ƃ����L�[�̗v�f���������A�ŏ��Ɍ��������v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Map_end(self)��Ԃ��B
<<< br

  MapIterator Map_lower_bound(Map *self, KeyT key);
* �\�[�g�̊�ɏ]���Aself��key�ȏ�̃L�[�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Map_end(self)��Ԃ��B
<<< br

  MapIterator Map_upper_bound(Map *self, KeyT key);
* �\�[�g�̊�ɏ]���Aself��key���傫���L�[�̍ŏ��̗v�f�̃C�e���[�^��Ԃ��B
* ������Ȃ����Map_end(self)��Ԃ��B
<<< br

=end
