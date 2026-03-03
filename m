Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2E31E84C
	for <asahi@lists.linux.dev>; Tue,  3 Mar 2026 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537498; cv=none; b=L4fTz+l7iynBC+asE2VLhsMRI2blqVQO6hipYJiBauUXLywkUjqL+T4Ng1jYvtThkFFo5LYOgK1YqLUmph5LgDfwafMAT5q8DHGhRXbe6SvetCfnl88dxlDeCUnuHqt0lMlfWO4b8beZIadnz97EDE6+gNkCPXK9nPWjtOaoVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537498; c=relaxed/simple;
	bh=Sh0Wyuegl3U89t2IMn2+3vPBnjuBYsEDi6+plbKyr8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tGS7uipMRAFWmp3XZ7T6Invi5Hlp31GLJZQ481T4MIbzk2cDDRr+eMCbOkGeRzA6IxRXHSbmRWq6YjAu2n3JaZHMHhGezcwUtwVEirsj7yipa3lM1KCeD+eJRkc/j5zilQ7f1Xzx2DlLVmUn+ok0rA8nlNjGanfc/H/C3rzweH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N7yvHL6N; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N7yvHL6N"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837a718f41so30803765e9.2
        for <asahi@lists.linux.dev>; Tue, 03 Mar 2026 03:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772537494; x=1773142294; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=38x5OncwAiSFYUDBr2ZhbAskiL0YL/di//zDMAN1dtM=;
        b=N7yvHL6NYhv25gwwXm+qQncavLZTZ+4B56wHs0dkL7h6WoU4dMkqUGj7tPVokj8R1g
         BjVsRH58SsA7F6x+wbsitCV9Ej8Cn2+/PbeH23nHx0BFlK3mvoMcDQejCiRBmf+N8uu7
         m3+sTkJpS3D9pGjo9IUj8ss3NCIJf/ti3PaZAvkZcnDC2S4KhWzDnBHhTHYVAgvBLoxi
         MqrRS11AxALX0NXfFhgzulqzPUk1JZzXmPX6VjCJBaHxZISoFeC5vTVBC9xMgLd12PpU
         i9PVa8c3QTv1ZRxq9QBnZWgsU6jKlwL8tOEt6pyGb4E94pdhUAy6lLpLEMLwmoddrNhP
         +YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537494; x=1773142294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38x5OncwAiSFYUDBr2ZhbAskiL0YL/di//zDMAN1dtM=;
        b=gaf1lSqQry5BTnXsiWFV3wt1an2LcdHEX9/sf/h2B87B0TNVbRjMSlm0c7uKO6pQXt
         u8S16bzxxnkHQEmdR1hJ4CWHHTiq++4aHIisqd5YyywCZOHwWmWGyyMUwZlvy0VBmuE6
         xNV6tItdOwl541jjhVEjSLOF09+h6MTDcQqD25E7h2ypPj9ZVoLsOIv8jPmCufqVq3qs
         nDaSjU3PpkoiYYBvR2e9mzbSwRRVNvuxwWEKgMOcK1LQ6LCr1hG2cKz8IRF2+UaYKE+Z
         O6A8IOSw9gBvsn85cCYWNZL+fT8h/nWKdKQpqhNjSp9VP2mRiItIiFnJYPzAZpuE0T3+
         d/6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLPS2bDRmU32Q5RocK4QzflRzFY+XKyKyv5P9dHOs4oliTTq0hFDkOjeptuaDWwyd3Gk9qFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhViQFttDrH4RwFwsi1OpKxRpoBtlCNfgbmmj1G8kPHYR3lmMH
	9KEmgYGORyJM5rormrCyrzwQEcLFmWDeCdmzSvLCpr3HuXEris+9Oq9TaA2Eglpi4sUlsDBb7at
	IwtHGv12CNtO4SuPOCg==
X-Received: from wmbbd15.prod.google.com ([2002:a05:600c:1f0f:b0:477:9dee:b5d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e2a:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-483c9ba15afmr297261305e9.13.1772537493662;
 Tue, 03 Mar 2026 03:31:33 -0800 (PST)
Date: Tue, 3 Mar 2026 11:31:32 +0000
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org>
Message-ID: <aabGlKYNd0CrO7_f@google.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 02, 2026 at 03:04:14PM +0100, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
> 
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:

checkpatch here: missing 'commit' before ceca298c53f9

> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
> 
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
> 
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]

Should probably be Closes: rather than Link:.

> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

change itself LGTM

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
