Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE02902
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 09:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0F3054248B;
	Fri, 24 Feb 2023 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677229929;
	bh=3rLQhx6pCgCH1nt/kKBODlV9KyK5V5WnU4JttIrGeaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JTqSOOWDObGQl6SbhPGAyeB+uQ6O8lswUeHi8xkPbyWkLEUUfcZFBPvNo/f+DoLiy
	 sAa07F42ncojNb88ZTr45LPoq6on1cAE58HI5xknUe2jMu0SXPly0nmxYoEYk79fin
	 0vWydqfZyx98WSLAqAE1kcuravP5WFg0fB3e1erHAHPpx2ohZ0oh6zEunuOTzFInkz
	 1WekJMKq/zA+sAQySxW8CNOWOCA90cppSHkYo7ZCbj55yP+wviGAUdbm/toY8pXoOd
	 zHTjO5RWL0EtKCTS0HkFxPpUCSFDyaKDtDLwRP9WCbKiC0lf7zwYdHGB9BJzAfSDOm
	 vwYhHEN9DMc7Q==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 18:11:49 +0900
Subject: [PATCH 3/4] rust: Add SPDX headers to alloc::vec::{spec_extend,
 set_len_on_drop}
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-vec-v1-3-733b5b5a57c5@asahilina.net>
References: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
In-Reply-To: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677229917; l=1258;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=3rLQhx6pCgCH1nt/kKBODlV9KyK5V5WnU4JttIrGeaE=;
 b=3Pem8NAkc0rGVxf2HfFKgkGSnKln0elEZpuaR/nwYWv/BNMPKncJaYFvU+c2iaRu2aDyaZdpd
 PgNNhZHrs9cCgbw7w67GdEMTE9b0Ofk5Gt3C6dqoMglyLeTHQLfOA02
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

Add the missing SPDX headers to these modules, which were just imported
from the Rust stdlib. Doing this in a separate commit makes it easier to
audit that the files have not been modified in the original import.

See the precending two commits for attribution and licensing details.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/alloc/vec/set_len_on_drop.rs | 2 ++
 rust/alloc/vec/spec_extend.rs     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/alloc/vec/set_len_on_drop.rs b/rust/alloc/vec/set_len_on_drop.rs
index 8b66bc812129..448bf5076a0b 100644
--- a/rust/alloc/vec/set_len_on_drop.rs
+++ b/rust/alloc/vec/set_len_on_drop.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // Set the length of the vec when the `SetLenOnDrop` value goes out of scope.
 //
 // The idea is: The length field in SetLenOnDrop is a local variable
diff --git a/rust/alloc/vec/spec_extend.rs b/rust/alloc/vec/spec_extend.rs
index 1ea9c827afd7..ade317ab96b2 100644
--- a/rust/alloc/vec/spec_extend.rs
+++ b/rust/alloc/vec/spec_extend.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::alloc::Allocator;
 use core::iter::TrustedLen;
 use core::ptr::{self};

-- 
2.35.1

