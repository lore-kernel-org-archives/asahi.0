Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AC259C9C
	for <asahi@lists.linux.dev>; Wed,  1 Jul 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914493; cv=pass; b=btfMUqKCUxPgSgd3698FbzN7tpWV/ONDBCZMxp+lf7INBSuh1i/Ma4y7DjNgB1aC/EPUaoKZNlR7igZxQzdpM2lcrDR8qBP2j9fWez1f/Tgq8XJvdIe7YCNujmNon0H6f92Dzgl2dU4qSDc8vDeRjdZLMZCkWbt31BFOdnTLDuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914493; c=relaxed/simple;
	bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEaQPK0BAi0+8PPGLVMdbetBL2bjMVJV9mHRPS61mCZMr28mSkv7PMpdx0M8Yr/miDfuFPmw191T9NWgPo88NvdH5bPRodd66XNgmKxIwi+wiAa3F9Mwx1/PtFGL1k/zvPjx1wk9fA70JPvZrNyECW+tt3S1OY8zgcxFTIgXKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3aZM6Lu; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3aZM6Lu"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664b2c00e12so996277d50.2
        for <asahi@lists.linux.dev>; Wed, 01 Jul 2026 07:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782914491; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5j6kt9YNkRllw0cTdSsLsPfLwNZ09IuhWPn3YN6Ak89MHA6ZIOKIiGXgxH1iIf1vE
         G7ctejyCgsqkAloCSA+JXohlOd9+QnFMl95NybAwziQ63hOWBIJA+wYW+nX1VnrpUoEr
         qOPW1Q6tvSYR7tmk572KAdXbvKMLbvKyONGJAKRIledaI1t0KDDAVmsrHpvxEE2IBCxG
         vEXpLp7G3n8KkqdfpxJl8wamM3O7GhpL7w73K8hsITKpHo+jcFzpqdYIK05W9F2kAEnM
         SDrmp3NraEVKVGsvRABPGIzjyh3g6H3+F3Yozr/2a8AdZUljkqg0eGgnGGphSDqlRjsS
         1LZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        fh=hAczoTMEe7EwMHPc+eOERoV3xerF/EWaCXf4j0i988w=;
        b=QUMwSf+OCe5S7FbuH0c5KtadT9ZlxZm2ok8zdWhEKIzaVlkTvhJ5VmP4XJUXY+60sD
         lN2wV3G4M/HO43Dk+6zejTJDWL/7UVOid/t1O9x42lcLbP9VA+XxQqOSHbSEIfeFpqRf
         omJwtmADFaQBtagfHgg0NYXnijv/5S95MmQKBQKIrafdOvu1RmduTFvCqgxrsDafQp+w
         BpeRFo0OY7Huu2v8Ny52eq7LaazYTGGRA6W5Eln8LfsK4NihWIWw+L6ipuuz9dSC4ouZ
         7wf11HycJ0IvJFNZDntvMgvK5xFjV+dVvFcjhFtnxx/6rrpUmDRhnn/YIHAatE46SRtu
         Ckug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782914491; x=1783519291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        b=p3aZM6LuYjLJLtNISufQiH9KL6we981zudOU++K043CAoyx4BOPpf2nFaMIl1SZXHF
         6mwlVKJojLZFNajpfjZkdHIWxlF8RJidwngZDLWfJPYxCGb9dvvV6I7HSJWyZdXn0uvO
         dfoyMNcVQ17q1NrHspW9Fp7Qnj+Dwb4EYSbEEmI3HH/7r6CnVTp/6wHegI/VUMFGcLAs
         sHEKY/P5MrhyJSo1SdPTtYwFe3hs3yRzsztDzTclBihz+1tEYeP7QeAge2gQOiRiSRl4
         eBS6pj8+WzbIFLbM3Cem2ij0tymhogwo4W3pN4XPGFokwTuiwoAsMV8NUXIjs4c0VfD6
         Cruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914491; x=1783519291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        b=ps7y4FzUbrNh7lxivcKLZeYq5b0F95dYiQXtsOhZTLomR/JP++5/R2ONfOAveNCkkm
         Xu+zHpvQfPQTCJu4cGOMNo7HjaWOeVkPkeY5MWFEZyeUKT2EoYcxtGWP9vdssfURyRW+
         drPkSbLIWgq9gnWj8c1L3zRDsGjE8GZggUe1Ihs+Qs2JWzr7TzRR8RZJFfFz5tE6dpfA
         rAGQLUjpxUM/uaQczmikuhajh7+9dZFqSTBzXrwUxHzoAmSZ69osEbsEYltiY7aaYx+w
         wQXgVEvkC9oqovSm1qH88jWHr4kP4hbIsES4kgj6uDo4GZlxiXaIAUOeejq8sc46kZDh
         uaLg==
X-Forwarded-Encrypted: i=1; AHgh+Ror+ZINoS2JVT2X0CZ2ikfjfon0GmvYEpmfZ55Vlca8+B/iQaCvv8aHdr9lFvixTPywdenTFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIt0jDz8nZg6OjH3jVQNUr2lJbsFnhh5xFgdgXKO0ONdB8gV8J
	k2/uh+roYGYpkndAugGDzf3gk/zo2DNn+9OMsV+kpKakyL0XYvIzm0a8hL51ZL4jVUwXd0lsuQc
	VSe526wC1i96cClNmGQR6bFHfCJm19kY=
X-Gm-Gg: AfdE7clVp6FNDmykdWXovxEkgd63W/Sw8ji/iay0jPoXA80TjJ0AwfINEuwKwDDE3dO
	okOlhp511eIP1xkIyzhof7At/shvmTixlK5vxH99hLMNa1hzgPI0AStSC/+CMTvSqZlC5AyrL/C
	z0U7kJfdDY2q0SSyC64i1e+228SHx6bAO0HXETX/ThH8M2/NKccWzSTbFqO2K2jkC9dKhl6OiF7
	z/1gl8gk7qs2sUGwELp7nVlGt3bpuqgA5QHmEnjKnbPZJk/iXeqqmyM9rg0cU5w7zgOytrFbrSz
	x5IedsvOaYCm/FIu/9mk/xiOAF/B3NVUSY6TwU1mry5XBVzaYz/7jy9L3WmYVQ==
X-Received: by 2002:a05:690e:b88:b0:664:ae03:5251 with SMTP id
 956f58d0204a3-66591634413mr801390d50.2.1782914491125; Wed, 01 Jul 2026
 07:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-7-506d936a1707@gmail.com> <B22C8EFD-DEDE-49C1-AD8E-BAEB5C91B6A6@chaosmail.tech>
In-Reply-To: <B22C8EFD-DEDE-49C1-AD8E-BAEB5C91B6A6@chaosmail.tech>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:01:19 +1000
X-Gm-Features: AVVi8CdUm7TRIKQUnleOwtMjaxBDCbjz3iJPuSJcM6iQODX-JToqKlxvunuUfag
Message-ID: <CANpmGNuoS+AK6yOo-S8Z7M9LbOqZXUN8Sgv46L_y=OYnU_orXA@mail.gmail.com>
Subject: Re: [PATCH 07/10] HID: apple: Add support for DockChannel HID keyboards
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 11:41=E2=80=AFPM Sasha Finkelstein <k@chaosmail.tec=
h> wrote:
[...]
> It looks like this section is duplicated in the following commit (8).
> Is that correct?
>
Yes, it is duplicated, thank you for the pick up. I moved the fixup to
the transport layer driver (in the following commit 8), which works
better, but must have forgotten to delete it here.

I will correct this in v2.

Thank you again!
