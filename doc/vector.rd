=begin
== vector
vector���g���ɂ́Avector.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/vector.h>

�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

  /* �C���^�[�t�F�C�X��W�J */
  #define CSTL_VECTOR_INTERFACE(Name, Type)

  /* ������W�J */
  #define CSTL_VECTOR_IMPLEMENT(Name, Type)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AType�ɔC�ӂ̗v�f�̌^���w�肷��B
<<< br

CSTL_VECTOR_INTERFACE�̈�����Name��Vector, Type��T���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �^

  Vector
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

==== �֐�
�ȉ��̊֐��ɂ����āAVector*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  Vector *Vector_new(size_t n);
* ���e��(�����������̍Ċ��蓖�Ă��s�킸�Ɋi�[�ł���v�f��)��n��vector�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void Vector_delete(Vector *self);
* self�̂��ׂĂ̗v�f���폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t Vector_size(Vector *self);
* self�̌��݂̗v�f����Ԃ��B
<<< br

  int Vector_empty(Vector *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ ���e��
  size_t Vector_capacity(Vector *self);
* self�̋��e�ʂ�Ԃ��B
<<< br

  int Vector_reserve(Vector *self, size_t n);
* self�̋��e�ʂ�v�fn�̗̈�Ɋg������B
* self�����v�f�͈ێ�����A�g�������̈�̏������͂��Ȃ��B
* �g���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* n��self�̌��݂̋��e�ʈȉ��̏ꍇ�Aself�̕ύX���s�킸0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  void Vector_shrink(Vector *self, size_t n);
* self�̋��e�ʂ�v�fn�̗̈�ɏk������B
* n��self�̌��݂̗v�f���ȉ��̏ꍇ�Aself�̋��e�ʂ�v�f���Ɠ����ɂ���B
* n��self�̌��݂̋��e�ʈȏ�̏ꍇ�A�������Ȃ��B
<<< br

+ �v�f�̃A�N�Z�X
  T *Vector_at(Vector *self, size_t idx);
* self��idx�Ԗڂ̗v�f�ւ̃|�C���^��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f����菬�����l�ł��邱�ƁB
<<< br

  T Vector_front(Vector *self);
* self�̍ŏ��̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  T Vector_back(Vector *self);
* self�̍Ō�̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

+ �}��
  int Vector_insert(Vector *self, size_t idx, T elem);
* self��idx�Ԗڂ̈ʒu��elem�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Vector_insert_n(Vector *self, size_t idx, size_t n, T elem);
* self��idx�Ԗڂ̈ʒu��elem�̃R�s�[��n�}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Vector_insert_array(Vector *self, size_t idx, T *elems, size_t n);
* self��idx�Ԗڂ̈ʒu��elems�Ƃ����z�񂩂�n�̗v�f�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * elems��NULL�łȂ����ƁB
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Vector_insert_range(Vector *self, size_t idx, Vector *x, size_t xidx, size_t n);
* self��idx�Ԗڂ̈ʒu��x��xidx�Ԗڂ���n�̗v�f�̃R�s�[��}������B
* self��x�͓����I�u�W�F�N�g�ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * xidx + n��x�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Vector_push_back(Vector *self, T elem);
* elem�̃R�s�[��self�̍Ō�̗v�f�Ƃ��Ēǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ �폜
  void Vector_erase(Vector *self, size_t idx, size_t n);
* self��idx�Ԗڂ���n�̗v�f���폜����B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  T Vector_pop_back(Vector *self);
* self�̍Ō�̗v�f���폜���A���̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  void Vector_clear(Vector *self);
* self�̂��ׂĂ̗v�f���폜����B
<<< br

+ �T�C�Y�̕ύX
  int Vector_resize(Vector *self, size_t n, T elem);
* self�̗v�f����n�ɕύX����B
* n��self�̌��݂̗v�f���ȉ��̏ꍇ�A�v�f����n�ɂȂ�܂Ŗ�������v�f���폜�����B
* n��self�̌��݂̗v�f�����傫���ꍇ�A�v�f����n�ɂȂ�܂�elem�̃R�s�[����������ǉ������B
* �v�f���̕ύX�ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ ����
  void Vector_swap(Vector *self, Vector *x);
* self��x�̓��e����������B
<<< br

=end
