Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48667C
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 07:26:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 89D5942627;
	Fri, 24 Feb 2023 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677223596;
	bh=i3HnPKPfmfqBLbRSmTJVD/vTe4oYMr0tLkjCkOowWxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mHLIUVdMDHCfaQJTwTd4ksLkgryWXo4VLHMXJtg6uviwjS5EWxgNNWlrSg1ErQ326
	 DUT0sJbw9/KAETC9dAI+xVTcWc821z+l/0Itw4jPQ3EAsow+BvlpxX4MxmUVcSQ0hC
	 Jbd7ERKwAlAsPZ4rat8nCUYk7vz9jsIcoBLbDaqux76T96/KICeEiRN09LcpJchb80
	 atp4F4FtXCN1yeQSEKB4n2bC5tzNweKbQ2BMq6uGQaqQgqHLKtJhqp1x0HPqSAS5ST
	 mJvGrztDEwGUmPrtEXITf/7GoixVky08rA+te6CgFLgU3f3rvcWDAo1oSQkEzVDqoU
	 yyF38IDwV0NxQ==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 16:25:56 +0900
Subject: [PATCH 2/3] rust: macros: concat_idents: Allow :: paths in the
 first argument
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-macros-v1-2-b39fae46e102@asahilina.net>
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
In-Reply-To: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677223586; l=1727;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=i3HnPKPfmfqBLbRSmTJVD/vTe4oYMr0tLkjCkOowWxo=;
 b=DPiJmYbiFviJCZNTLudvSrFUdKkvqk1hC9plJ20sOU8vPA9fwNu18df1XX8QF2ceaXXwpg+Y7
 XS7veM7W473AkoL6twukc3WNjQq33aFILRpHVtIayz6H224BE84By1p
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

This makes things like concat_idents!(bindings::foo, bar) work.
Otherwise, there is no way to concatenate two idents and then use the
result as part of a type path.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/macros/concat_idents.rs | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
index 6d955d65016e..d6614b900aa2 100644
--- a/rust/macros/concat_idents.rs
+++ b/rust/macros/concat_idents.rs
@@ -14,10 +14,28 @@ fn expect_ident(it: &mut token_stream::IntoIter) -> Ident {
 
 pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
     let mut it = ts.into_iter();
-    let a = expect_ident(&mut it);
-    assert_eq!(expect_punct(&mut it).as_char(), ',');
+    let mut out = TokenStream::new();
+    let a = loop {
+        let ident = expect_ident(&mut it);
+        let punct = expect_punct(&mut it);
+        match punct.as_char() {
+            ',' => break ident,
+            ':' => {
+                let punct2 = expect_punct(&mut it);
+                assert_eq!(punct2.as_char(), ':');
+                out.extend([
+                    TokenTree::Ident(ident),
+                    TokenTree::Punct(punct),
+                    TokenTree::Punct(punct2),
+                ]);
+            }
+            _ => panic!("Expected , or ::"),
+        }
+    };
+
     let b = expect_ident(&mut it);
     assert!(it.next().is_none(), "only two idents can be concatenated");
     let res = Ident::new(&format!("{a}{b}"), b.span());
-    TokenStream::from_iter([TokenTree::Ident(res)])
+    out.extend([TokenTree::Ident(res)]);
+    out
 }

-- 
2.35.1

