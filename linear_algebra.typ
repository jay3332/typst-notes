#import "helpers/template.typ": *

#show: template.with(title: "Linear Algebra")

= 合同變換（Congruence Transformation）

若 $A \to C^T A C$，其中 $C$ 為某個非奇異矩陣 (6)

則 $A$ 的對稱性會被保留，因為 $C^T A C$ 仍然是對稱的。真正的問題是：$A$ 與 $C^T A C$ 還共享哪些性質？答案由西爾維斯特的*慣性律*（Sylvester’s law of inertia）給出。

== 6F $C^T A C$ 擁有與 $A$ 相同數量的正特徵值、負特徵值與零特徵值。

特徵值的*符號*（而非特徵值本身）會在合同變換下被保留。

在證明中，我們將假設 $A$ 是非奇異的。那麼 $C^T A C$ 也是非奇異的，且不需擔心零特徵值。（否則，我們可以考慮 $A + epsilon I$ 與 $A - epsilon I$，最後再令 $epsilon -> 0$。）

== 證明

我們想借用拓撲學的一個技巧。假設 $C$ 可透過一條由非奇異矩陣組成的連續矩陣鏈 $C(t)$，與一正交矩陣 $Q$ 相連。在 $t = 0$ 與 $t = 1$ 時，$C(0) = C$ 且 $C(1) = Q$。

那麼 $C(t)^T A C(t)$ 的特徵值會隨著 $t$ 逐漸變化，從 $C^T A C$ 的特徵值變為 $Q^T A Q$ 的特徵值。由於 $C(t)$ 始終非奇異，*這些特徵值不可能碰觸到零*（更不用說穿越零！）。

因此，大於零與小於零的特徵值數量在 $C^T A C$ 與 $Q^T A Q$ 中是相同的。而 $A$ 與 $Q^T A Q$ 具有相同的特徵值，因為它們是相似矩陣：
$
Q^(-1) A Q = Q^T A Q.
$

我們可以用 Gram–Schmidt 對 $C$ 的欄向量進行正交化以構造 $Q$。那麼 $C = Q R$，且矩陣鏈 $C(t) = t Q + (1 - t) Q R$，在 $t = 0$ 時為 $Q R$，在 $t = 1$ 時為 $Q$。這個 $C(t)$ 是連續的，且經 Gram–Schmidt 變化而來。

$C(t)$ 可逆，因為 $Q$ 可逆，且三角矩陣 $t I + (1 - t)R$ 具有正對角元素。

這樣便完成證明。
