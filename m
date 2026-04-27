Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F936894B
	for <asahi@lists.linux.dev>; Mon, 27 Apr 2026 05:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269533; cv=pass; b=YA8K/3+NKq7SuIpRGtQwnP98kKARJEsbokK3nWf1/6YfnNRFgsG1ej8oVr9CbxT5pR0yKwdvKGdy9r/rHvZFGi3DKRSJppxnwheudK39xgwo7S8Yy2GccnfV8sWKM5s4uDSdSupU7/KQDv43gsG61F/eKmV7M8Tzgpt5iSFKiec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269533; c=relaxed/simple;
	bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtVeYgrMRejG58tia4aYzqT8Fnjts4Yur33o5gl7YT+lgnEPd6oVwGLsBis9zxkDVk+8G0Schhn4smURe97cl1koA3jUbgUq/8n1ZZAVaQ+BXWLXhZYTmolAclUTiKXg/GdbA0uO579wAhCvL/7bF+8zNgPUajrSUWMjjJ+Uq2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN6kuHme; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN6kuHme"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b458ca2296so60284135ad.0
        for <asahi@lists.linux.dev>; Sun, 26 Apr 2026 22:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777269532; cv=none;
        d=google.com; s=arc-20240605;
        b=fhW1opjQenxeum3jihkTNcP38Xk3F3kb7ChKcfwijt5Ivqmjyl+dbbhq17InHzb4L2
         3AsIS6qbwQweFphTJD4SZ/gZqS9JRrm4LJbThwo5HDGvOTZCIy6rw/tZtmL/8zHMaGvk
         cHWAJJyzQ4E+2rrBHfy3ppdNS6p6FNXjk+wxbLWH8U69LK+oUi8YLUblcv5sf/KjRi+A
         098ZKuNxID455srRPwiJDXa1c7dtXI07PB7w/MZbtkV+zCsPIHY45/dbjrVVeNha+Fjj
         bU772JfJLX/yRWspKifoEGqqkkPv44kAooQ20sTZwG51T75lbhswSpTEKu33ZYI3fAGD
         YFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        fh=ohl4DOsgxb+hNvmnURLZjIsVOOTIE7OU6J+HWZVD50s=;
        b=UqO4HVi/xRslickU8Xo5cV7iT0m7aBBO9R2UOsLthpE5eYvCFhCqOlIQFchYoRJcRk
         uo25ctKRZFrH/Enpici02upfga1Rwd31HFGVbMwSkmVBHwG7vseFK18z03OA0PP7erC7
         atmWmuQQ3iYdhVWyEpXs1VqTATGPFiVDRvdsZEuI7FOBmwVbmGFjxQHOXrqL7VNqHbM8
         jhIdXeSWn7ed7BszzV/OIdXgI3MNFctOAwsHYYEhYS2v9mGF2xAACIlQ6WFC0lGRnGR8
         Ear71O8gtCNWekfVcoL1M5o0mLwgeJb0bDZACwAO5OGz8eqvoel6yS/w1Ri2WecypOrJ
         bZMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777269532; x=1777874332; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        b=MN6kuHmeu3xUfikhWnShbOYm8uU9qiETDQi9F1a6bDKQpp+vC3T7ly+ncLmjpZiZfz
         FQcBoojv8Hmzuv7OUbwWdDR1iuCCwYBxUZyng5vyuyoC28fObn1uS6ekOFaKNTl7Wacu
         pCLKPZAz2kFyEmveI2ICB4DOjMteJykFLpvj+/01Xh9JaUAOlZmRejx76VanbQyD+3vS
         l1vWS5arNYoH75FlFfkDpjeZiYRaaIF1ohH6P58yOaS23z/4tAgJwluM1aPbUnC/AUrK
         c2jzI0zlCD+d/tka3ynMg60LdSGd3oWipKj+o3/7swPwnWqbcv6aCCJyo2/4F305vfHN
         bTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777269532; x=1777874332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        b=IU6TYw9A7EXzvS3o0E4hMvxH03z3UsDGQqzy156Y5aGQkamt1fgMeRKcZamJH2uwU1
         etBneam2e93g8Q/eTrQ2diRWYfNkZwIHpRPFfTLi5rNL4u/USCE7VEh1l5yHt06LTaDm
         Uyo2puvHsftIzxBo3KpHGD4cuLzTwO9MsmxMJsbdT29MCmeBxXvWEpM9QFdl4NnGuGdT
         v4XAr2WJkRepqgaUCSZqBfTk7txiw4LUmfeug25EuGs1R9CQsqL7IcTs3sUzoyXrskTf
         F647LEzgEPYBG9lsrMI7c57AaMt8BFIV50jHE/BBSzsfwo+TQ7GSXWXQDK4HvFVAZJrK
         SDpQ==
X-Forwarded-Encrypted: i=1; AFNElJ83QuHBZ5x4RMtUYPFJbiNT7nh3xAeXMeMO0XoEXBNO4O5uk5HbDvREeswMOhkP4451pxqD/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+pWhzlCmHUBctqh8yIKXGvI8iF5uzYcKS7XfmPPftS/BOZtUM
	/gklElPlWcDBEIj8eB/q862VT7rSB3ll9cfJQgqKhQqFHOAywFNuKGAY5f4eOAW27yMecINZdH/
	/Gv4aWkoPSl7loRBMOPfi+Xc1iACLgSA=
X-Gm-Gg: AeBDieuN5LCoSynKxPYWHkCZJ5LY9pZP3T20VMOgrrmYPE8nLfU92aDbd9OOADwDOoU
	n4Bxmu+qHDouCPGXYePQp/RSrb1qndvhHFN1cz7fj0VkbT89n93KOHSbR8l/p821qMwRFX+zEwn
	jlhtG2HPriU8rTJ0Hfd3Y0nkYmOpxy6+EKXcCEiRcfGqK5TNFSxNgfn/vq6Wlpi3CgIzbEtvnra
	vNccezfzdgGzLmsX+hbTT3sW+UUsupPA8TXq5JWhRIXy9ReDth95c9Zp8tkNNU5n3IeyG2QgrzP
	lis51/FBhkOBJ5SIKvHxKhufhFrD/Hyqf/ua8oKNbtCVGrVg+dCxQf3idw0GPQtwf6A4YDpWTLF
	oqkev02HJ
X-Received: by 2002:a17:903:46c8:b0:2b4:5f83:a9d6 with SMTP id
 d9443c01a7336-2b5f9fbba9cmr423017415ad.34.1777269531920; Sun, 26 Apr 2026
 22:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423125154.156257-1-phucduc.bui@gmail.com> <177724034927.266775.12675076324275289049.b4-ty@b4>
In-Reply-To: <177724034927.266775.12675076324275289049.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 12:58:34 +0700
X-Gm-Features: AVHnY4Jc9P5RStYCGah8cZOylaS3eZSUurg1lrhWabGzqo6DH_6c4mwf2b_62Fo
Message-ID: <CAABR9nHn7qrXnmaaaST8yurc46GZXf3iARjQ9BuEb-OPtvZqQQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: apple: mca: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for applying the patch and for the explanation.
I'm still new to the process, so I appreciate the guidance.

Best regards,
Phuc
