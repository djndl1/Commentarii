<TeXmacs|1.99.6>

<style|amsart>

<\body>
  <doc-data|<doc-title|Finite-Dimensional Vector
  Space>|<doc-author|<\author-data|<author-name|DJN_DL>>
    \;
  </author-data>>>

  <\dfn>
    Given a list of vectors <math|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>\<in\>V<around*|(|F|)>>,
    and a list of scalars <math|c<rsub|1>,c<rsub|2>,\<ldots\>,c<rsub|n><around*|(|i=1,2,\<ldots\>,n|)>\<in\>F>

    <\equation*>
      c<rsub|1> v<rsub|1>+c<rsub|2> v<rsub|2>+\<ldots\>+c<rsub|n> v<rsub|n>
    </equation*>

    is then called <em|linear combination> of
    <math|<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>>. All linear
    combinations of a certain list of vectors form a set called <em|spanning
    set>, notation by <math|span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>>.
  </dfn>

  \;

  <strong|Span is the smallest containing subspace>

  <\theorem>
    The span of a list of vectors is the smallest subspace containing all the
    vectors of the list.
  </theorem>

  <\proof>
    For a list of vectors <math|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>\<in\>V>

    Let <math|a<rsub|i>=0 for<space|1em>i=1,2,\<ldots\>,n>,
    <math|a<rsub|1>v<rsub|1>+a<rsub|2>v<rsub|2>+\<ldots\>+a<rsub|n>v<rsub|n>=0\<in\>span<around*|(|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|)>>

    <math|<around*|{|b<rsub|i>|}> for i=1,2,\<ldots\>,n> is another list of
    scalars than <math|<around*|{|a<rsub|i>|}>,a<rsub|i>\<neq\>0> here

    <\equation*>
      <below|<around*|(|b<rsub|1>v<rsub|1>+\<ldots\>+b<rsub|n>v<rsub|n>|)>|\<in\>span>+<below|<around*|(|a<rsub|1>v<rsub|1>+a<rsub|2>v<rsub|2>+\<ldots\>+a<rsub|n>v<rsub|n>|)>|\<in\>span>=<around*|(|a<rsub|1>+b<rsub|1>|)>v<rsub|1>+\<ldots\>+<around*|(|a<rsub|n>+b<rsub|n>|)>v<rsub|n>\<in\>span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>
    </equation*>

    <space|2em><em|<math|\<lambda\>>> is a scalar in <math|F>

    <\equation*>
      \<lambda\><around*|(|a<rsub|1>v<rsub|1>+\<ldots\>+a<rsub|n>v<rsub|n>|)>=\<lambda\>a<rsub|1>v<rsub|1>+\<ldots\>+\<lambda\>a<rsub|n>v<rsub|n>\<in\>span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>
    </equation*>

    Thus <math|span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>> is
    a subspace of V, and since any subspace containing all vectors of
    <math|<around*|{|v<rsub|i>|}>> must contain their span (from the
    definition of vector space), any subspace other than the span is
    \Plarger\Q (containing more vectors) than the span.

    \;
  </proof>

  If a list of vectors form a span which is equal to <math|V>, in other
  words, <math|span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>=V>,
  we say <math|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>> span <math|V>. If a
  vector space can be spanned by a finite set of vectors within itself, it is
  a <em|finite dimensional vector space>, otherwise, an <em|infinite vecotr
  space.> (Not really defined yet here)

  \;

  <strong|Polynomial <math|P<around*|(|F|)>>>

  A function <math|P:F\<rightarrow\>F> is said to be a <em|po<em|>lynomial>
  with coeffecients if there are <math|a<rsub|0>,a<rsub|1>,a<rsub|2>,\<ldots\>,a<rsub|m>\<in\>F>
  s.t.

  <\equation*>
    p<around*|(|x|)>=a<rsub|0>+a<rsub|1>x+a<rsub|2>x<rsup|2>+\<ldots\>+a<rsub|m>x<rsup|m>
    for x\<in\>F
  </equation*>

  <math|P<around*|(|F|)>> is the set of all polynomials with coefficients in
  <math|F>, it is a subspace of <math|F<rsup|F>>. Every polynomial can be
  uniquely determined by its coefficients.

  A polynomial is said to have a <em|degree> of <math|m> if there are
  coefficients <math|a<rsub|m>\<neq\>0,a<rsub|i><around*|(|i\<gtr\>m|)>=0>
  s.t.

  <\equation*>
    p<around*|(|x|)>=a<rsub|0>+a<rsub|1>x+\<ldots\>+a<rsub|m>x<rsup|m>+<below|<around*|(|a<rsub|i>x<rsup|m+1>+\<ldots\>|)>|=0>
  </equation*>

  \;

  Zero polynomial is defined to have a degree <math|-\<infty\>>

  <math|P<rsub|m><around*|(|F|)>> is defined as the set containing all
  polynomials of which degree is no more than <math|m>.

  \;

  What if a vector in a span can be uniquely represented, i.e. only one list
  of scalars makes it a linear combination of a certain list of vectors. Here
  we define <em|linear independence>.

  \;

  Suppose a list of vectors <math|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n> in
  V<rsub|F>>, if the only choice to make <math|a<rsub|1>v<rsub|1>+a<rsub|2>v<rsub|2>+\<ldots\>+a<rsub|n>v<rsub|n>>
  is <math|a<rsub|1>=a<rsub|2>=\<ldots\>=a<rsub|n>=0>, then
  <math|v<rsub|1>,v<rsub|2>,v<rsub|3>,\<ldots\>,v<rsub|n>> are <em|linear
  independent.>

  \;

  The definition is just a unique of representatin of zero. Suppose there is
  a nonzero vector <math|v\<in\>span<around*|{|v<rsub|1>,v<rsub|2>,\<ldots\>,v<rsub|n>|}>>,
  and that it cannot be uniquely represented, that is

  there exist <math|<around*|{|a<rsub|i>|}>> <math|<around*|{|b<rsub|i>|}>>
  s.t.

  <\equation>
    v=a<rsub|1>v<rsub|1>+a<rsub|2>v<rsub|2>+\<ldots\>+a<rsub|n>v<rsub|n>
  </equation>

  <\equation>
    v=b<rsub|1>v<rsub|1>+b<rsub|2>v<rsub|2>+\<ldots\>+b<rsub|n>v<rsub|n>
  </equation>

  <math|<around*|(|1|)>-<around*|(|2|)>>:
  <math|<around*|(|a<rsub|1>-b<rsub|1>|)>v<rsub|1>+\<ldots\>+<around*|(|a<rsub|n>-b<rsub|n>|)>v<rsub|n>=0>

  Since <math|<around*|{|v<rsub|i>|}>> is linearly independent,
  <math|a<rsub|i>-b<rsub|i>=0 <around*|(|i=1,2,\<ldots\>,n|)>\<rightarrow\>a<rsub|i>=b<rsub|i>>,
  thus <math|v> must be uniquely represented by
  <math|<around*|{|v<rsub|i>|}>>.

  Conversely, if all vectors can be uniquely represented, choose <math|0>,
  all coefficients must be zero, implying linear independence (the definition
  of linear independence). Thus, for a list of vectors, linear independence
  is equivalent to unique representation. And <em|linear independence> is so
  defined that we can coefficients other than all zeros s.t.
  <math|a<rsub|1>v<rsub|1>+\<ldots\>.+a<rsub|n>v<rsub|n>=0>.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>