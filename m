Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0687188CA9
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734881719; cv=none; b=WZzvJ5MWuRVaQOu1pntcANh66Du4bNzRrp4LF1PljjKt9vmzcvT5vvl393roM09gz6z370eLTvbXbvHfc6KM6zVIB+4LTT9msNm7uaZW28X/E3kP2K494R1oEHR4t8pP+9mtWa4q0H3vDZAxMrNrQ5+p9fWExBAsRFF8bDtnOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734881719; c=relaxed/simple;
	bh=9GjqyJMg09DCuYPoAHgqnPAHj4DLiCTnwq4yWavSIlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utL/Vi6igdIBLZVn2Z7QHMC9B6vHKo1++fcF7HNEP+djIakcRATi0hrwjwoKxanURnf2maspk5t/sQJEY17iaQDBnJzRkjkOyEYH5NrXWwjEoqfJ/7pSR+cdfvAV5Vz79qga8JUd667fxpxgkaNu6f8Msh5/dqhFPsZIHqXqRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNW03+ZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNW03+ZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3915EC4CEDC
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734881719;
	bh=9GjqyJMg09DCuYPoAHgqnPAHj4DLiCTnwq4yWavSIlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LNW03+ZMpvcE0AQBTB3thE14MW0eFCAdRakozESjslppOZQMEd9uDwydvmqf6y8G1
	 Zr4+kOW4eIPiq3aCYbGQKVReHmbgMT36omu393jsyMiLom1CsY+VYbgoPVNxL/iM4w
	 zQDcMYiyo6/BzQ42E8BcodXQlmI7dRUESYRkve6LgIm4+inet2TnLzLYONYwLhWO0l
	 2v/kaCMukFIh6LIOuh7Q8eIPdq6jp0GeepbIxiR8S4rtAJr40FBqLq2gMYHkbYbvXL
	 9lbNkIK4vSdGCppuBKtKyiAIRCa/V9DnG/ZRxI1EPL27UvzmD6IyNjlSvNzrTWzDBi
	 xFk6QNDchoisQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so3594317e87.3
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 07:35:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKoyusebqhd2wtHsrirH0B4Lu8soKdB3H/hk+nW64KY62lomz8j4nsCC+ZQ6mFm0LiTNvTXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDPYMNlK6/kNudQDp1zvVToqaQJpquxIpbyik/17HO2/NyxzhX
	P3wz5KEVgEMliXnoXht636oKM9qIC3Fr9OidDKaobwFnoaXfgIBqhO8ih7jH9mCOOZx0Vx3eVnt
	c83wkzDhDUfriQp57TH1tUP3fSFo=
X-Google-Smtp-Source: AGHT+IGX0ge+oIG+OVUU9qdGOK5bBf8+T98POZAqy0/yqeJA7FZF28K0qTWuu83caIz3ApeSC9IJtu4UY0yOQ4BjUNY=
X-Received: by 2002:a05:6512:4007:b0:540:5253:966a with SMTP id
 2adb3069b0e04-5422954b39fmr3358159e87.34.1734881717617; Sun, 22 Dec 2024
 07:35:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com> <20241212081841.2168124-14-ardb+git@google.com>
 <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
In-Reply-To: <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 22 Dec 2024 16:35:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH8W=o7yqZjL1QHud8sfA5=-aJ9HGO1opPhwihdi_28pw@mail.gmail.com>
Message-ID: <CAMj1kXH8W=o7yqZjL1QHud8sfA5=-aJ9HGO1opPhwihdi_28pw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
To: Nick Chan <towinchenmi@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Dec 2024 at 13:05, Nick Chan <towinchenmi@gmail.com> wrote:
>
> Hi Ard,
>
> On 12/12/2024 16:18, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Currently, the maximum supported physical address space can be
> > configured as either 48 bits or 52 bits. The only remaining difference
> > between these in practice is that the former omits the masking and
> > shifting required to construct TTBR and PTE values, which carry bits #48
> > and higher disjoint from the rest of the physical address.
> >
> > The overhead of performing these additional calculations is negligible,
> > and so there is little reason to retain support for two different
> > configurations, and we can simply support whatever the hardware
> > supports.
>
> I am seeing a boot failure on Apple iPad 7 which uses
> CONFIG_ARM64_16K=y after this change in linux-next as commit
> 32d053d6f5e9, with nothing appearing on serial console with
> earlycon enabled unless I set CONFIG_ARM64_VA_BITS_52=y. Reverting
> this patch makes the kernel work again.
>

Thanks for the report.

This is a known issue and has been fixed already in the arm64 tree a
couple of days ago.

Once linux-next is regenerated, things should start working again.
