=begin
== algorithm
CSTL�́Avector, deque, string�ɂ����āA���ʂȃA���S���Y����񋟂���B

�A���S���Y�����g���ɂ́A�����}�N��CSTL_XXX_IMPLEMENT((-XXX�́AVECTOR, DEQUE, STRING�̂����ꂩ-))��W�J����O�ɁA
algorithm.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B

  #include <cstl/algorithm.h>

CSTL_XXX_INTERFACE�̈�����Name��Container, Type��T���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �֐�
�ȉ��̊֐��ɂ����āAContainer*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

�܂��Aint (*comp)(const T *p1, const T *p2)�Ƃ����֐��|�C���^�̈����ɂ́A*p1 = *p2�Ȃ��0���A*p1 < *p2�Ȃ�ΐ��܂��͕��̐������A*p1 > *p2�Ȃ��*p1 < *p2�̏ꍇ�Ƌt�̕����̐�����Ԃ��֐����w�肷�邱�ƁB

+ �\�[�g
  void Container_sort(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f���r�֐�comp�ɏ]���ă\�[�g����B
* ���̃\�[�g�͈���łȂ��B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  void Container_stable_sort(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f���r�֐�comp�ɏ]���ă\�[�g����B
* ���̃\�[�g�͈���ł���B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

+ �񕪒T��
  size_t Container_binary_search(Container *self, size_t idx, size_t n, T value, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f�ɂ����āA��r�֐�comp�ɏ]����value�Ɉ�v����v�f�̃C���f�b�N�X��Ԃ��B
* ��v����v�f����������ꍇ�A�ŏ��̗v�f�̃C���f�b�N�X��Ԃ��B
* ������Ȃ��ꍇ�Aidx + n��Ԃ��B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n�̗v�f����r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

  size_t Container_lower_bound(Container *self, size_t idx, size_t n, T value, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f�ɂ����āA��r�֐�comp�ɏ]����value�ȏ�̍ŏ��̗v�f�̃C���f�b�N�X��Ԃ��B
* ������Ȃ��ꍇ�Aidx + n��Ԃ��B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n�̗v�f����r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

  size_t Container_upper_bound(Container *self, size_t idx, size_t n, T value, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f�ɂ����āA��r�֐�comp�ɏ]����value���傫���ŏ��̗v�f�̃C���f�b�N�X��Ԃ��B
* ������Ȃ��ꍇ�Aidx + n��Ԃ��B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n�̗v�f����r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

+ ���בւ�
  void Container_reverse(Container *self, size_t idx, size_t n);
* self��idx�Ԗڂ���n�̗v�f���t���ɕ��בւ���B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  void Container_rotate(Container *self, size_t first, size_t middle, size_t last);
* self��middle�Ԗڂ���last - 1�Ԗڂ܂ł̗v�f��first�Ԗڂ̈ʒu�Ɉړ�����B
* first�Ԗڂ���middle - 1�Ԗڂ܂łɂ������v�f�͌��ɂ��炳���B
* ���O����
  * first <= middle <= last <= self�̌��݂̗v�f���A�ł��邱�ƁB
<<< br

+ �}�[�W
  int Container_merge(Container *self, size_t idx, Container *x, size_t xidx, size_t xn, 
                    Container *y, size_t yidx, size_t yn, int (*comp)(const T *p1, const T *p2));
* x��xidx�Ԗڂ���xn�̗v�f��y��yidx�Ԗڂ���yn�̗v�f�̃R�s�[���r�֐�comp�ɏ]���ă}�[�W���Aself��idx�Ԗڂ̈ʒu�ɑ}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* self��idx�Ԗڂ���xn + yn�̗v�f�̓\�[�g���ꂽ��ԂɂȂ�B
* ���O����
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * xidx + xn��x�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * yidx + yn��y�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��x�Aself��y�͓����I�u�W�F�N�g�łȂ����ƁB
  * x��xidx�Ԗڂ���xn�̗v�f����r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
  * y��yidx�Ԗڂ���yn�̗v�f����r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

  void Container_inplace_merge(Container *self, size_t first, size_t middle, size_t last, 
                              int (*comp)(const T *p1, const T *p2));
* self�̘A������2�͈̔�first�Ԗڂ���middle - 1�Ԗڂ܂ł�middle�Ԗڂ���last - 1�Ԗڂ܂ł̗v�f���r�֐�comp�ɏ]���ă}�[�W����B
* self��first�Ԗڂ���last - 1�Ԗڂ܂ł̗v�f�̓\�[�g���ꂽ��ԂɂȂ�B
* ���O����
  * first <= middle <= last <= self�̌��݂̗v�f���A�ł��邱�ƁB
  * self��first�Ԗڂ���middle - 1�Ԗڂ܂ł̗v�f�͔�r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
  * self��middle�Ԗڂ���last - 1�Ԗڂ܂ł̗v�f�͔�r�֐�comp�ɏ]���ă\�[�g����Ă��邱�ƁB
<<< br

+ �q�[�v
  void Container_make_heap(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f���r�֐�comp�ɏ]���ăq�[�v�ɕϊ�����B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  void Container_push_heap(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx + n - 1�Ԗڂ̗v�f���Aself��idx�Ԗڂ���n - 1�͈̔͂̃q�[�v�ɒǉ����āAidx�Ԗڂ���n�̗v�f����̃q�[�v�Ƃ��čč\������B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n - 1�̗v�f����r�֐�comp�ɏ]���ăq�[�v�ɂȂ��Ă��邱�ƁB
<<< br

  void Container_pop_heap(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�͈̔͂̃q�[�v����A�q�[�v�̍ŏ��̗v�f�ƃq�[�v�̍Ō�̗v�f���������Aself��idx�Ԗڂ���n - 1�̗v�f����̃q�[�v�Ƃ��čč\������B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n�̗v�f����r�֐�comp�ɏ]���ăq�[�v�ɂȂ��Ă��邱�ƁB
  * n��1�ȏ�ł��邱�ƁB
<<< br

  void Container_sort_heap(Container *self, size_t idx, size_t n, int (*comp)(const T *p1, const T *p2));
* self��idx�Ԗڂ���n�̗v�f���r�֐�comp�ɏ]���ă\�[�g����B
* ���̃\�[�g�͈���łȂ��B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * self��idx�Ԗڂ���n�̗v�f����r�֐�comp�ɏ]���ăq�[�v�ɂȂ��Ă��邱�ƁB
<<< br

=end
