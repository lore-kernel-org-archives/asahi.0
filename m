Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80C2F7445
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115434; cv=pass; b=GN3cO1B6UBaUPwtx5JSQ4EnR4mb0WCnLwLhyuS5U8uI/K/iOpm4DH4c9gzJ2sB4P1sA+USBoe7u6mD1ljrHoz1jj5j63bIboTU25u0anKmt7vmarCPv0u21wTcer3Pk6eRuO10gwJeVCe8Wz/s1SSGsg0o7Xe4Vnfs7X4I5mNc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115434; c=relaxed/simple;
	bh=xclsxU/OKlyZxe04QWb2jLBYOc4h57dKWedu3IwQS38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM8oO45YLDbNJD78PLECnaDssCFXkqiQBxoJZ+fb1O+BDAzNDt/c/V09TR67gRndrR1cRhkEqAVW8d+PHL47g2qGU6WkUke3Sfh0PxV2XlzlIuC36a5vyu33zNBf4CyImoYttnaAx2rtfTks+ZThS6VSsGHkNDNRF2+wHjz/u24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BThR/Lid; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BThR/Lid"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6756a6320f6so492270d50.2
        for <asahi@lists.linux.dev>; Sun, 04 Oct 2026 05:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115432; cv=none;
        d=google.com; s=arc-20260327;
        b=noVBfivP2cwIhNQRj7WO/hEzwxQ1FsQa4r3U3JtJGdjvU3fhlGWFwpHFahhiUtNFms
         2bPkNHnCCMzvHJnYDKWqdw5a7bOr93NdO80ozeJUHWcEBYHIeWwJbSgMmepRKFqVch1R
         zy5InCmxyLeO4VqFQwbT3CrKuLV2rrj592xXjssHXTuCzeJN+AxIcnJORsBgzq8+4p6A
         Jp+C0ctxjjr1Wlh0WzsxJkf4RlNEQQiymhvZueBS5Sazm5pV9mYe1aHjvWiIB58CO280
         JO8hPNy9WTMnD0XbVFtE+x7aaR7Wp7OGbVTm4pIaNnluoDECNEiDtoOfNpgK1YcJCRTU
         Q7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        fh=6CtzeXqSzFqb3S/K7P5QXzpSCjcih2ZzMvshsDqVv3w=;
        b=WEN/HwZ1ZJ6/Tyx7hlA4PUPToczWmui8DtBWGYODqb5QtTTBWYsk6JpJAsYu52usck
         /Q3qX2fGPYbuN0A+IR8C8UbDyc+6i9UzccuPrPWcFHL+tQk3U7aIHRRNPevsZgYLxAxz
         J6+9JdG6tW2RG53k/yj5sfVFB08d8U4Po4fM+YPHHBi/l88XlHqATOCH9QueRc5yXhIq
         z/m3inB+m2ENyNYQNyhKAbGSTsmn/t8OSf3Y11xZrlGZUmUbm5RNgK6T5T45JkHfaOGC
         U21RDGbjudAgrtVMJC+JjogcpTW82Ci3eyFBP+WBcQKn/fK4pe/siKVaLWXJ0lqo1foX
         GnoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115432; x=1791720232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=BThR/LidShSkTaIygLYsR+8Ro5M9RvCCKCeafHheeGsCPpgFwMVi80YkpW3FazX6Tw
         Mfs1+kQTB9Oq0FAMh0jN7hHhw0E7GhCietHuMBQyFKdRKJHMwcr3yMENcGreolJDsxk4
         HVi1deiYRbLDN5ZFawv7Op2v5+zAGsDuvzljW9NsQILfaiFt6VEKM/LnzkL4fMFkHKJv
         o086pjO5KHrSKXG8HdtvZsaD+hugCG9AnsxU14X3daLh36vACgMef5zMt4kWrGqxKEZL
         MLW1XuUICypt9viZ8FT9gD52dnJPqSwykVzbOSCPyxw+2hggyAlNTPcVUiWRiHMiKFZp
         8fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115432; x=1791720232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=GGgtoseNwB/Pa3H2CWTt2v6NWyaBYT2bz4Vl9qXRqamWqyWByJIB+j418APUzgVVbt
         q6JlNtW8d460m8Dt2BVydUxSNefzzKM/fsO81E3W9UYgyCUnb/linBXkghQoplz2R8xs
         71reSk55j0jWEoDAxYTBlbGkrLNSl5Qgep5Jb20DG6pSbX8kCiiPoV3t8H0uxZR2TZCi
         GQ1Pe8Fe4nJP8nv0wDL/6mlwomGCPdwbu5Te/b25yS/2qDoYzIU8Rmf5L4fmHPojDGMC
         UpvU+QV3GoU6UMwuhw5TFqLgYxIDXQZIpkYG6ZbNe+Q89GGd4CLmQKBFv7wKOuVl/y2z
         vrCg==
X-Forwarded-Encrypted: i=1; AKwUvBwG+1fdPaVsdEym7JTvfGAYH3te9z3PvoH2FKfLrzGQVKEoBca9/O1Q9JUlNyrvQgduK+OfOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJrj3YniIN4m/y201ekawTnrF506OEqhHtbVyFvpu1eBha23WRX
	MT3o/eoaxHbygXB9KTW3FCgcM+1d08+jGLVF7SQruDEkamUvkiHHUen36VNcvbT37QCu9fE2at4
	3cq9jGP6SKHe/fYMS5ve8+H9xGWiTd3M=
X-Gm-Gg: AYBFou2PUmsXxmTy5t9tHMWqTm35cRFiknYBZjkhYHVHDIg5gHGKEQAdHcbJGXRkEL1
	vP9fM7XWssOUwkxX9FGuN5AqzuKgNfFwenTi8sberbrdG7djVUbXezyp7fB6LdpbJJ4cD27z54x
	Ui18+YJtOkfSlfmmtGN69jrtU4e2aXccGkv5mfuo/M1sb4NjkyczxuV7Ms56OArBoTbnvv84gZX
	BDpdSOCjdOqrFTHiEH6rXxi8HyHvDvRG5cPqRfOCjcEmlQ5dGVWZPxLgxhJH458tgJJkQ1S4N0P
	62m3ciwKDHwbX2HbgvwDWaqGPQZaL8b7NVSlBLsEolxDvmCi8hqgEdEaAcJXdinXppgbxl8Krcr
	O0tp64g8U9HyHVuxOqwOmsRhiK/7joUm+RMdUradPrcEd
X-Received: by 2002:a05:690c:c50f:b0:8a8:31ad:3eb5 with SMTP id
 00721157ae682-8ae398af9c7mr32497627b3.28.1791115432330; Sun, 04 Oct 2026
 05:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com> <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
In-Reply-To: <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 4 Oct 2026 23:03:41 +1100
X-Gm-Features: AclHuK_AzNA1kHsdQJK4JzjMKX_G4POoldRIESfIqws1tUYpdz6muZxIlnl4ufw
Message-ID: <CANpmGNuD9mvO7J3g9gG9_cA6ZDKRweGubBb=yQ_51Ojtx1Owag@mail.gmail.com>
Subject: Re: [PATCH] regmap: Drop map lock during cache init and exit
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 08:43:22PM +1000, Michael Reeves via B4 Relay wro=
te:
>
> > Commit fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and
> > freeing the cache") added the lock for Maple tree lockdep validation.
> > The current Maple tree backend uses internal locking, and cache
> > population is now separate from cache allocation.
>
> Do you have a reference for what you're referencing here?  The issue is
> precisely that the maple tree does it's own locking with a spinlock, if
> we ever use the maple tree from a hardirq context the use of the
> spinlock in hardirq context will be tracked and then on removal we'll
> get a locking inversion warning when we try to free it.  The maple tree
> locking is entirely unneeded and forces us to jump through these hoops
> but there's no way to turn it off.
I was looking at 94a3a95f0315 ("regcache: Add ->populate() callback to
separate from ->init()") and ed5d499b5c9c ("regcache: maple: Split ->popula=
te()
from ->init()").

I thought separating cache allocation from population meant the map lock
was no longer needed for cache initialization and destruction. But your
explanation makes sense, thank you for pointing it out.

I think I found a cleaner way that avoids that issue, I'm testing it now an=
d
will send v2 shortly if it works.

Thanks,
Michael
