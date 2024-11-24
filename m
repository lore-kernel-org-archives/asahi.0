Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE13186295
	for <asahi@lists.linux.dev>; Sun, 24 Nov 2024 23:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732492589; cv=none; b=UrSmgUU5W9b2ywplCiY2pk04tORohfM+T02CLw5f6NQOrFU096w6vimMFpjnwTtI+UzRC/qsoVI3EvVYJVO5i/LcxUZcUx8K25Oz995JafwQaNxhW0YveNaZLS+UCCQ1Xv3qrzUpoX9c3MQcWkpmrqbIz0eZwJOM7EPSPL6lx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732492589; c=relaxed/simple;
	bh=5XsI2dnv37mBv+p+BtUHDZFriUnNCf9wr1yXZXeXyFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0bCd+kcDNUHtUWlAcMXc93aRBiHuCytJyiVC2aCvNiJ/BushLcoUa6vTJBH/sLZxDJF1hsjlCN+2BPzCn0uWUqefDB+B31DLV32Hjqitbg0TpWRxPAB2Nl1uYwXsi6SOziRyAm/ccYCvV/2n7mJXSve4zQMd3So6Hn+L8AUM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSFOESXm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSFOESXm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ea33a70fdfso650144a91.2
        for <asahi@lists.linux.dev>; Sun, 24 Nov 2024 15:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732492585; x=1733097385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XsI2dnv37mBv+p+BtUHDZFriUnNCf9wr1yXZXeXyFQ=;
        b=RSFOESXmbBepJTG+x+tSDX5vrPTvd3fX2kYHn+VoSdQBOTqbE5Fi8+feMXjyDUM8IE
         Fly6eC1qJVbv3tRf5vfX5S0JA9EHCUKt2MIlSOJ7WxrN1AuCMNF8kLagHBLwFrjOvUYH
         aeCaqWcAm+Sdo41cxyPG7srPIXQ4CUt72Ft30ajINbfwoPEeJf+zpVdpYA8jB4qniWS0
         sDwi7jK0qec87uTKBAwyeWcXzgzSIu0B0cX9jccFuTb6rQvxz+v6RF9P3oSQjGGZunc+
         wDWcAkVsbPwATfgTxf9ob3NwGycdlGCAyHdVaRQgYK75fJ1ik7W2s/5oCTLTpooyPDhU
         b0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732492585; x=1733097385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XsI2dnv37mBv+p+BtUHDZFriUnNCf9wr1yXZXeXyFQ=;
        b=Umbz/ghrhaJDhbwzz4796meydU4n5R8mv6e/0KkzgchEFmdUpYLA9lVtpG9IvFKy8t
         In1xYghBa4Rdkf/yOfeoLAiZf+Y1p0QHZ5XeFAaaH15AIZA3pujr3pWT7LFOJrR2Uc9J
         Rxw6w3Oz1j76Sg+inCs+6vqYmEZ9t/dqonRBQDAASQO7k2IqllAh1T7aNX+pDOyR/1jW
         C6jVYJwOJKu5Ovl1iGZP+xkIfkAiQyb8tCYvdkllw4KIPtH9yjCa3jgy6a8vS0n2z5d6
         fGIPa/ZN7naxQa0oQBSpaTDLKeuRbL/jMSCUbyALPfPkHHIVkn7fm6b0UXzypNCmZWRl
         ZYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsnic1usTN6U6DUyJk6IlyGXcWML8c4LS2JHwyzBWmVn1130ETRshtxtDdC/tQSVTzQ8w6HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVfWJH3Deqv02OB4CVqxS3v9u9LtaNSsmiCaw8WbWilFaoqP0t
	vb53QTNFj0EdNNVUvCUVgMcFObihxM7v82i5wuggvewlY2qHJ4cJjCIGeFXT/p/ZRx8o9PnctvM
	hAK8J2n7g2MmlHcBN/3mbWyNkDyg=
X-Gm-Gg: ASbGnctfr5+LhNPaXg23hEyueQETLB4MPlZq94LUonJhhf1G0p3xj0sO8zACjrhPOI1
	35ZdWEiY7O8ZkR+iSG2qOjoeZFzRGzQ==
X-Google-Smtp-Source: AGHT+IEI7GYwhVxYuokBXCBQbL5ucki1Qy1so2aGi+FFVysnEyTiRPfnjOrI8Gl0mVt194WhWC3goLNn9vaUL4FIULo=
X-Received: by 2002:a17:90b:4f44:b0:2ea:956b:deab with SMTP id
 98e67ed59e1d1-2eb0e87f52fmr6103731a91.4.1732492585588; Sun, 24 Nov 2024
 15:56:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
In-Reply-To: <20241123-rust-fix-arraylayout-v1-1-197e64c95bd4@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Nov 2024 00:56:12 +0100
Message-ID: <CANiq72=bYXd+Rx4tTmoUPeSMCuPsmrNWzX6fnBR+siULzK4t1A@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: Fix `ArrayLayout` allocations
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Janne Grunau <j@jannau.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:30=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> We were accidentally allocating a layout for the *square* of the object
> size due to a variable shadowing mishap.
>
> Fixes memory bloat and page allocation failures in drm/asahi.
>
> Reported-by: Janne Grunau <j@jannau.net>
> Fixes: 9e7bbfa18276 ("rust: alloc: introduce `ArrayLayout`")
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
