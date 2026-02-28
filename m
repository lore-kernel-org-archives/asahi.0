Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E64286891
	for <asahi@lists.linux.dev>; Sat, 28 Feb 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287784; cv=pass; b=Z0TOuaR/FUNF7CL8oBGk/L0IrloAQe3GfUVGYm/fceGS+XrHSd1ngIe+snOk3xmiTEQ/oh/HN97oWPx4ldE2kbiAbdrAvMU8vagEiDAJAds1I48Tk7p4gfqumfH1CMsE+93ROB1SOTG0zI5C+ibTKO7FGdqikfPiQj+z29zZu7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287784; c=relaxed/simple;
	bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGwVmrOWVw0C3iSTUUa1C9uh9gWfWPo+1t4WyxZ9qzlMKe6GEw4ny3DI97+mupT6ykeQ99EF6wu9cMHsHo1IfDbAm/wyHbRc+MC86u5eP9u3FqJWwWXJ1C0lp47y7GPngww96nmA9QQh9tD12RukG1mDYi/OMsjqb2ItPOrrPy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms64Kp0K; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms64Kp0K"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdb82b69f4so154964eec.3
        for <asahi@lists.linux.dev>; Sat, 28 Feb 2026 06:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287783; cv=none;
        d=google.com; s=arc-20240605;
        b=E1Jka4xylgI9Hdu+D5U87HDF7Ic+iMWxdDnJU4+Z82fjBMi/i0mjODMxUSCkDhU9Zx
         VrnAb33N9JKozzHw4jiajJBlvUWl8haWMLtY9polWn9CDHC8dVgQRd3xqglVx9/96ie4
         8rYYw/3IUZ83Pd9+AKMQcxiJx+VeYH6CDvnGyuEHWj9w2uWNkEccZAY3K8ZgCU3Wz6y4
         8mmLT6IJb+YDQa8ibjvQdkaLVVFLpHm9Sh5xuvx7h/iOvs+gKbZ4lhO6h+uJZEZCio1l
         uJW8aIPb1iErlIk+YtTHFqeN4TmkNB5k26uszYtJIbGt1Tm3BbW6Q+LnLiyApbs6ZT5Q
         sdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        fh=kJZvYpwdFwzZjKxHzqAxqt037WzdA0OqifkHh+WGiPE=;
        b=eNH2KJf3T7QJw/M9LO4Jg0Z3DgrUrfJUBg3aa10idNsv+Aa8FEJ3T2oUuLq40RVpAF
         uOU+fGQzchGNnDQ7/ZlQjapeUit1EijdNA0IHFo1X+X33B2ZnZazlIc3bDJ6ZEE3yHmO
         Ii179h8e4FObT37VJ84OxPMegeayc6YNTPn79w/aAtWG85lvnwim7oPf6EEkhm8PPtQy
         AJkjwD2GA4RClsTq7irM5rixFrAWFlgv9ZNHR+906M9MgZ/uWOzaDghLIrO9WkGq+Y4C
         76rZIxvL+tYzCsR5DOBL3hPmmGN2pktL2L5mTvM5g/esBQOoLlJ0SgoGmX/rFTZeRTYJ
         c6Ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772287783; x=1772892583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        b=ms64Kp0K/0rcbsr5f7xEEsveDem05YW0U6ueBuuj3oERUHgEis8UC+S055zOuLC315
         HvuAxvTxPanB1b4ObTjLU5G9uwDEPYnbeLFKXDs2DY7NpDyuxcJjx6oWNwx1iuRZOdI6
         zgoqDtBH7+XniQQAOKg1gIMSULGhuwF0yhCYSJuDgE+j/JLonidUFjE8rBKJM6DeA4/g
         K69uHPyAff0YCPatdHN+m+2qNEvVYT4my/xFHCaI11twRCeV5mnMIP/jbftPPNnbIaRI
         eSEG7wznPh+jjqoApjwXsJ2jqY9K6hP+WQER+X3hO/y09FJanck2pY2MYeqKYuzZn6al
         GvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287783; x=1772892583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ad5ViPg4F5q58dcml7U51wvG6H2OdjKxWdEWYbzf1k=;
        b=bUgvwAYMtvnwneWf8EhbCQkKt9aufv70Enn16RQbE18DBjOd3AX5GL5p3s1hP54Y0r
         uJpR46U2T5bq+XzzsvAUFlZjkPHes0GnpqRz0CmsjyFmrXOh1uqw1qtWIDUMYQB7KmSV
         9p7duT/fw7wuhD36LT14xDrHqqGU3/ZH2L6qOZ2nNiHGiZXpS8CsOU5sfTmS2mGqtSp/
         5QnizcOb3FKBkNJHjHFxzzdh0H5IArJ7nG1bANo3oY1sR1XVAUQZ6EMnunNwdBO6tw8n
         SV6NZxz8htYUVDGSioRg6As0L9r5TyWGbYyeSr4Yi3ltB6s9TcoGN/E0lQ+TOO6nzKDF
         hixQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO58WUGnbc6vn+yy5MrBOAIqAwXzs6elaJPHkgkd/UYcEqoCdxSNxgCVMvEUgoGfCos+hcMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBZOL9oeZdvocK4n/4dd9h2gtNPq4l/CDldyFw07bLSUEWzPPL
	RBsAQzb9G4eEpB0gEcthpahMO9tjy3d/InTuX5xMWgiJsTazBzC70jyEE7wrYu0dqgnvmDVIEMi
	K4jDA9/kzz/9hIEYMDHfdrLk3SjELSws=
X-Gm-Gg: ATEYQzwmNMFhWPfJaOEQjubPRliCl4G+fjNXI2Kq2zYx+6w4iJ2JITndA/bddczDFC1
	CgK+VQ6yZvZbK5Rwed2YulFxZx1EFr6m5D8Skt2JgQ/vQdsa+AIWlPHE7hVZX73XenumtacLHfE
	aEa4msh4QNiebA4k/zXSJR7gKeoghxVm25jcQBQ5OIUoRWNVPPYA96tTPwXMjTwRVA2WglJ68Rp
	deqJE8OtvJt0k/ofkXYswSq2/ZOD7bWPB5ceDuUklhiH5wlRnsqp/L0U7wcAoMcHhpIqzLLXLKO
	6R/ZQ4IoVndMCJb2+DwzsrzRl0fOJEN2lxuQuUlxM0FepFP2rOYblSZjcNpdsFZ1qTRrMvOh7Ts
	wgcYRMiTuRbHLz2z2HFTxnQjZAUzE
X-Received: by 2002:a05:7300:724c:b0:2bd:db75:c283 with SMTP id
 5a478bee46e88-2bde1d5e3aemr1108757eec.8.1772287782724; Sat, 28 Feb 2026
 06:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260228113713.1402110-1-lossin@kernel.org>
In-Reply-To: <20260228113713.1402110-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 15:09:30 +0100
X-Gm-Features: AaiRm50szvIfRFXSTL2frZgjUpT-JGt0pzE0jav9lOhN5cEXeTSsJV_EDM9YSmc
Message-ID: <CANiq72=U8Hvpz-cqHyc-3WJu07HLeaAkB2vhUhtROFqeWrFSVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:37=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> The affected stable trees that are still
> maintained are: 6.17, 6.16, 6.12, and 6.6.

6.17 and 6.16 are not maintained, so we can ignore those, i.e. only
6.12 and 6.6 will need it.

Cheers,
Miguel
