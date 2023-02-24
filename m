Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00794320C
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 10:53:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 44C634206F;
	Fri, 24 Feb 2023 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677236024;
	bh=sJXKzM9ye5UpmrgbyuuthZgT+KWJTloP+4kPhG+KQ/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oa1/MEiiXrg9mbqpHfbEKIp8g2n5RxkQB42j1wGBzAU51cFkRJi7ueQBGd/e59Brl
	 7GoMcsyCOveOh/QgTpe9MahflHSAX3d67TWE2Fkll+LVpC7TmLb2WlFNCThlREjzLD
	 6GUpv6nT76QR2+qiaVjO8JIWMCYT5kO15bKsbjxwjSY0wh0Cev51ebn/OijewbwjpB
	 /2qDSDR9e03ZKD8m6EG42hw0Jst6DA4Y7tLPtc2WHipqK3rY5QbcvsFPcLPsQM58bK
	 yhVVjgcSEvXz0Lox/JZZk/8axll9MDYOPzV8hitLUmGKRjGCHDuyNKJzDhgwlbFUDR
	 G8/MIhnVT3HKA==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 19:53:13 +0900
Subject: [PATCH 1/5] rust: Add a Sealed trait
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-iopt-rtkit-v1-1-49ced3391295@asahilina.net>
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
In-Reply-To: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677236013; l=780;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=sJXKzM9ye5UpmrgbyuuthZgT+KWJTloP+4kPhG+KQ/k=;
 b=2N7EOf9lvtQl1KnhDXXm0FkvG4Na7dWKbQBTLsMk8jqk7B7Y4WPfN/hlCBMv3CBOdYjE0fIKU
 E+XrQbtCkZPD7FsAJAXaDP50Tbk5LoTqUkrE+GslcgajYZk1801LH+S
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

Some traits exposed by the kernel crate may not be intended to be
implemented by downstream modules. Add a Sealed trait to allow avoiding
this using the sealed trait pattern.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 223564f9f0cc..82dff6f4cf60 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,11 @@ pub use macros;
 #[doc(hidden)]
 pub use build_error::build_error;
 
+pub(crate) mod private {
+    #[allow(unreachable_pub)]
+    pub trait Sealed {}
+}
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 

-- 
2.35.1

