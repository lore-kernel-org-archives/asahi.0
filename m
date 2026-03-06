Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668634EF12
	for <asahi@lists.linux.dev>; Fri,  6 Mar 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791675; cv=pass; b=vF+4372LjeLOf6mgi4C0WMn0gN6cAZeQFR/JYSCEF79b+PlhvrzYREvhkrG3jV+FYLNXN+F3omjl5ODWBVNokuIVnqKQaBwe71aJx1VRKmNnvLprhJtqGUzY7M/DlO4NFKu0gOTSimz1NHQWQsNcl8aTzNrTT+cDr7m+TKcdDcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791675; c=relaxed/simple;
	bh=Fhf8ctLQ4I809lq/hxfBzgrOONnciSWT06sWsgYCOZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi61jSRj0hTEnbdHVpInHmnK0SzqiIfJ60t3sxvC+WqrWB63ivizRbP9dNM2RspSVoo4WhEH8UMvghrqr0+X4uVxwDfWIpOQMncQWa+U25vES3GDj6aQiqcjQgGhMbWFEx2sSPyXD3ovI1dXk1KgnnTlxaNIYh36TgN4h1PWc3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQVqMCVB; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQVqMCVB"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124b07e5fe4so409871c88.3
        for <asahi@lists.linux.dev>; Fri, 06 Mar 2026 02:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772791672; cv=none;
        d=google.com; s=arc-20240605;
        b=kyTsqY0z0I4xy43d2V167PUzh8QUWasPaFP+2/rgGw4p3c5Rd1g7sKu69Vh8yzq4Vj
         tbmUEj2IoMFSVvl+JeMwZM8PDMVYnzEzrA57cuNcDlCMtJ5AofmirhgZVKQcELgY1Bya
         K9s/InUwPJ+ecEEcFHj+hPYPmXZoSXKXcCFjEtFchTmrIGM9K49QR2Bb3X47+npxRJi4
         LQ7seg5z1SofQGTXRVho24gPcGWQkNkTUaT+/XGyU/P2Ze6pA+le34OSBuOeoS7b1f8c
         R3L9CpwmUuk7Bf6i6GcwL3+fVp1OZcZDgueLRosYwdTXSkjFc6iHCIosA/WmhS7nO9DE
         /L3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        fh=MGkBfP0fY37GZLu7F2zMcn/3mHoQyLVJecZEC/9xSAY=;
        b=h118TT3cWmmpFnST6EzlI34gySU2wrLjMgR1XrKZmnmNsUDCxTqgelCGHG3/G9QLa7
         DUPRQ1ZZRbytmWskFUhregAhfsoy9lzUPPlQ3bQh0rMOf9lToI6HgcclDlMbEcO3Hb02
         XyhlNZ6JEgstYT6Jr1JKO8EsMo4L/kQL2WqyQ+kZsMO6eqFrpUSKpyyxAPKW23s3JB+3
         ZyvzgNqPW9CkM6DEMvD7wl2dxOTVj+0UwCx5ZP+wTUghTPsX/+oOgtBo3HTOF3NgNyBD
         P7Lb6EdvIdQkkxV9W+1hSj8HViU7WynGYQPhwbE3k95uLzeBgVLVbJXm+pZIH5xhEF+m
         PaNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772791672; x=1773396472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        b=MQVqMCVBuviadrqcD9NzsCec0DLEQUGNJKBwUojOEi3Z+MdAZ0V35LabtrIqgfwAh6
         DAfAEbVVxqYlx5CbVUspejNAPCQdPDyNtcRDb3x4d0ocag1OuZ/2v3G6NW02iImkkbYX
         TAvDxEVAWyPMqNeH/knRzgwMFyLZ3SmQDkRbb1tERk4w7B4nsR+7sUlRRXSPlT5Kj0yR
         MSv8kfE+D730ByJpV+ojF8/7XiZOul7GTDOy0RFqGNrKRsM/HOFSXbJmOcke4098hvGm
         q5tF8bvCMewE5O9vcoo3nPoNR1jDTP25r1u4cGfOMRGYwdwkkRhsYNZEevwuENnjP0JV
         TnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791672; x=1773396472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++lqn1eH7/e+zPojLyuT5tGFljBqP9YQWzYLYUROh3k=;
        b=w1DIwaKWW65BoiOGUGJhhcDGc9HmMLCHYlwn0bfOcDkdORy0YYJyiaA7sm+zGzG5Oo
         gEIsA8b11di2W5/Sbfd6G9OclMA3yLtAaoVD3drwga65rOOE5d2hhSOvGY5kF7Ua1fxA
         5BcOarWHT1WNfRblHHD+bBAPOqfLrzjWFSwprLlR+0pwKgvqSUb6Ey9O9eUCUUuWSNg4
         +KIsuBq6e3CIgXVWRL9+55VY0DPfeZujyfSbMQ4avHUWOmHQMo2c7YbjewuvJ6CoQu/w
         7q19JWDaAnbbueMDViQHjZmenROzttO8PIpGZf9cMLTFUM5L5j/COWVydJh9bhj0jWa4
         xuYg==
X-Forwarded-Encrypted: i=1; AJvYcCXllFcCjh/X6r3fPCTVKdX8m6W3WqYiJN5wiESIy7ecVEvFl0bf66u+iILaruJSzpAGaV4L7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoA+lRmJejaDinU1qO0TJAe3DDTTAMLwEjf1U3xK2PisnybpwG
	v8eNf1COayVtT16v0bQ6lXyk8uA9buuT9MoQUkKf79wxmJZ3TN83XWAwJpkEMU67jXoHFOhnm6z
	TBywkfMCU7eY3T6TGriVoLs9a/D2wbL8=
X-Gm-Gg: ATEYQzx4oMOw4iCAQ8zyFvbfXayts7v07LlhHj0RNYE6/WW7pgUnuuYeUhiJb7Ro7vr
	v/aiR9X670FksBEOjDLaZVccOZ36nk8QplWnyuIYMEDCmStdfWJ1dT875oy9VMvSrtFnLGcX0iG
	NiAcXZWjf6NnHVu+OC8KfIXnu05LSysMGaNkUXEIShdztPgsk0AfgvZRnHgaApnFjXh1beMW7Z6
	5yRVcxiPKYh2+gOv3E7ixk0pIlJZVqS7/kBcx00rXgxSKa4GI8GAUxOMO734S7Tsf7z+OUt4hBP
	uZGXF2YXaqXylTG11EBe1qMLxQcmoNH11a+NMihQyAahDe9Bx8QaryXH/77Qqy8paSasWSMFGs1
	xNGmio/7BURTQhYQyVMQ/u8r0E5GZBEIDiBA=
X-Received: by 2002:a05:7300:a887:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2be4e03172cmr363173eec.3.1772791672496; Fri, 06 Mar 2026
 02:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org>
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 11:07:39 +0100
X-Gm-Features: AaiRm52OGxVDcIvbac_wkfqvMT0_HUteDugri4evs7r3G_bVSd9Sc_fQlcDPxrU
Message-ID: <CANiq72=LpEDdZC3yucxseXdq_iUZ4HwU0JSWRgWYWKwQNTU9Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 3:04=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
>
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
>
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-ini=
t/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch fo=
r referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Adjusted tags and reworded as discussed. - Miguel ]

    [ Updated Cc: stable@ tags as discussed. - Miguel ]

Cheers,
Miguel
