Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24035C693
	for <asahi@lists.linux.dev>; Mon,  7 Sep 2026 21:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816124; cv=none; b=aqfgSfJdH8eI44pw51uqskyHKYlCy0Jc6ZXXSIu8THsLZL5IHuWeGNUmS5nMmLbu5RSk5p2/VBUMraLuZJIWUUNebjkgdSUgovRZKG90i+8xGfo5SlJKwk4a0sK10wzZ7Q0lvJDVxquJk17Eu4IjiR6LjGXiSuF6OHiCxA7qKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816124; c=relaxed/simple;
	bh=fZbLypJibxs8mHxTYHjptjunIdlyeRgAk2j40n0T5ww=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=LQ/jhGv0KFrkP7V0vCjukLqM7Gf8aPaUFcXJdsaZfpRnW2eGJIHZaScFBz5/NKKvlFrqU3So/n5XQsHESwCTbVeG0BJECRQJA5SzOZa8Z0Znyr/vyJXv0vjb5+hMRJ8IW5hwLwT5yj1FcR/VSfA7LJIQCOO7b5Tfv0tJ2uUNsvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=WyYiGwcE; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="WyYiGwcE"
X-KPN-MessageId: 277d77f9-ab02-11f1-861e-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 277d77f9-ab02-11f1-861e-005056aba152;
	Mon, 07 Sep 2026 23:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=eOsYOi3+aSlzY0FOxeCqq7jWHfjR831Z8CB/oGrto0w=;
	b=WyYiGwcEk4Sn2gHgjjE+ZYA8uprptCVqnI9DLBe4H9WcrYc3aEaf/9/uCWtTXTi+pbcAkyPxtUjt/
	 LEeI9dkca7XZUKxyF2kY+qRqsozyz0y/3xED2imvnOmdeKFj3q4tOJM5FmKQ+0xWD/tGA78gaC6r4F
	 xfQXljduf0b+BZtjsTULFN1860ggWluLhOtqtULku7VMdFwueJs501zmzI+K4IvI67lSlIGIBXd8q9
	 F1c+EtR1CBQRjwR6r1xegAeucL5SVHhnOo6PZSouPG2EYIyBe1rZxH2PVSr6tn6p+toe7RSEBJ+T32
	 jd0xzrx0Rn+e3QMICWBN/sDvJrtGjvw==
X-KPN-MID: 33|gja5xEZxciysXLvWI5GcSNIEn1Ns/HXOJoPqJ3T6AvjMxLQwNMwIxqwJuuCoqXd
 3E2g8uTWZK+8BuPXQNBkwRstEeQ6HsW6SPYJfnX23M5A=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|VGsV4M5FEVOXPmImpMVYhy04k8bCkoHeaY9fqmlthOgGhyisItXEC18Fq1dk8uG
 jMM4g6YwuLcZ5pWgeM83lQA==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 26f9491d-ab02-11f1-9281-005056ab1411;
	Mon, 07 Sep 2026 23:21:56 +0200 (CEST)
Date: Mon, 07 Sep 2026 23:21:55 +0200
Message-Id: <87se3ksqoc.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, asahi@lists.linux.dev,
	kettenis@openbsd.org, sven@kernel.org,
	neil.armstrong@linaro.org, bmeng.cn@gmail.com,
	trini@konsulko.com, fberder@outlook.fr, j@jannau.net
In-Reply-To: <20260904-apple-nvme-fwabi-v1-2-f7ede661c469@jannau.net> (message
	from Janne Grunau on Fri, 04 Sep 2026 21:22:40 +0200)
Subject: Re: [PATCH 2/4] nvme: apple: Never set the opcode in the NVMMU TCB
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net> <20260904-apple-nvme-fwabi-v1-2-f7ede661c469@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 04 Sep 2026 21:22:40 +0200
> 
> macOS always sets this to zero and the firmware starting with macOS 15
> has started to complain about what we're doing here.
> 
> Based on Linux kernel commit cc0fec9b42cf ("nvme-apple: Never set the
> opcode in the NVMMU TCB").

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-3-bde19ce8db04@kernel.org/
> Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/nvme/nvme_apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
> index dc94988e2ff..f615f8fac4a 100644
> --- a/drivers/nvme/nvme_apple.c
> +++ b/drivers/nvme/nvme_apple.c
> @@ -121,7 +121,7 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
>  
>  	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
>  	memset(tcb, 0, sizeof(*tcb));
> -	tcb->opcode = cmd->common.opcode;
> +	tcb->opcode = 0;
>  	if (cmd->common.prp1)
>  		tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
>  	else
> 
> -- 
> 2.55.0
> 
> 
