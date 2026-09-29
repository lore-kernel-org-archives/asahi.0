Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953CE5275BB
	for <asahi@lists.linux.dev>; Tue, 29 Sep 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688145; cv=pass; b=uOw4b8swTFSttKDvcWXaRrau1Oc9rD7J3Qa27sm4gZidcErUz1ytPmi8/MVmd6bPPiHhxk/6tsLxo2SGSVM6hzx7mtw+8HGxb5TnNC1AFWMAcFHxeXT0dCQ1M145140ROzNl0qCl+ZqMclimrdtAGGPRPhd/SiWlui+ZrgypVe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688145; c=relaxed/simple;
	bh=9kGGIoKUXsVY33zGMSg04jYAL3JPXU1LBRMzAUAEyQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk47+5YHlyzpNuyvY/2EgU31NwwN51VU7kKpw50zzhjzLCgzfeNMR/e8OvdXHCNRofsOQtEbPuEwlFOPWkonquGmyZ/qxb1D38GlCJOi3orY5nQ5ryiWZm3z9nbAuglfwNxOutcGaeQqeIqtPQ5MDN02h9KVeM2QlLhnLsf0Jv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDhdp6JA; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDhdp6JA"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso6437522eec.1
        for <asahi@lists.linux.dev>; Tue, 29 Sep 2026 06:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688143; cv=none;
        d=google.com; s=arc-20260327;
        b=IFoAuPI6PFQFGSGHlVT/huHJOLZKnt1S9EM46GaYS2uDyjOj54gzQlNfvdFoUOFixl
         w/vmTtFAPK+tA14S+npbjrGIgY7IIBHUuufmG155+uCijl0TqJpz5dz9bY1XuPnOOd6V
         PpTKj0DtLKIoF3E2AN1OD6lzDy7qoPIHo1sOqyOZFEU8NcYKIw6fj9pUFSZI/oyZldqq
         zwcpuferqvBpNPOQ5LAfT/wgKo89+0vkseS3vOmUoHwy3zTtgz9P0GCRryvKqZoIbRkO
         7osJODQvC7ZgKsa0XhoakifMnURiPpVkxv22MI5F9O6R4Gdu58O4LP9Qjf7NI7kAk2Qx
         /t9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        fh=nURKbDRAwxhYqLru4uzrevlhOg+lXDs4NaSCdW2Y9gw=;
        b=VYpGH1YjXtTu3ExDOdpGii4TIXbh64OBcQ6TEH0AQIxAIe2eIRwObIMY1EFjA57w2e
         mn4KSQE1Y9GDySeCl8q9XMzo8wPeSw9B9L4piJn9S90tX6ZwlF6NhjW0PTN3/mSnOF2x
         yvHuzZ1Eq4/wkYCC4QgIOzi+KoPSPIvT0J5tcPBrjBKLZwOTKpS7HpiPrRVdf2sGMiKI
         C6LkRnI/Uvw9bv2j+lgiSx3Za5vDOuHB1q9Y++n4qibFO8pvFOtAhyCNDF+kXgqOPyWr
         SttcxNZ+EXUtt4Kt01lGPky2FPfbWQvEkPL4RTMbqJpkC7YqLfZqB0S+14X1L9ngZFD2
         vtDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688143; x=1791292943; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=gDhdp6JAKj6QTkZjkm2qdqpzpVxS6TnTQv1X8kN0FBQxKAyJIOnlTT8Nkxr/nsKu5I
         0y4wr19SMoVvtpxxMaahJIVqn/vAU25rt6jsQ6x3TDn8m5NH5KLW9D/lXrzfIIkM+K4L
         EPYFudU5cUyrMNgfhhIT8z1sdmCSe/95PT58v5OedbueQEraCjxg/P+W+NHTz2V4y/cW
         ov+Hdg1kPaWyqkEFdji/W+WtCwem5DUL6IFfagcKBZ3TXXL1U5TLmMnkenwcilBfpmwl
         gkTpXTsgNGz+nJipiAn+N5nJko98FVdf3mDkjiAYJ1dsV0eWV0FPtx+jrfnhzmWiNKym
         s4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688143; x=1791292943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=oK/FQS5kOdCwpz3KpR6k+EhiZC0XjqTe1oZs4+H4v41xaADAmo/taneUzA36RZunU5
         4H79itWRP5lrzF5yYsKTKQnQN0nHoaKZxxORDuZoXrg2ALpvIUEUhBQKDAN4rGxPa8Gh
         kD5V28wGZ1iqeI4GS2vj6E7qSuC0UuO9BToeONiqjqPUHSWrLR3EAFDC+d0r5+Fe9lZI
         t8817WZE/bIDhJQfYsTEjCMl0pWzG/bMxHUd30quGyNnPxr0/1OCloS3aLUeZZnVsxzB
         PU7b3E7MjK92H1j/q3XaeZcDDsi3spxOgCNyDyw4SpDzmExBwEue8DP2nK3fVFE3bwo4
         DXZA==
X-Forwarded-Encrypted: i=1; AKwUvBxwoLlJIlRtPRQdIZx85P+HeDMpgoksZeqw7X79PMPdr7wE7yZd0DhZoaXvVgZvo2QfTYQo6g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsc9s9KxJM3GyfBU8e8fZnXCemZSmbkrNgXqRuLCSaza9Ppr+7
	4QlYJzpARpNQ4xm52jVjllKJQLqa924n4qmgiZpVCRqUCcGPTAAtW6kxLZZpp4XlNm4m5XC5EHX
	51sHORHugzELwHAM6o6nH2iAwkUdQ0ic=
X-Gm-Gg: AYBFou0ZmO0oche+Im5jW2q/sfyorYDGxYgL6YcuBqtDuL68PCbHwr/1OmY48O+VZi2
	UQppu8R2RqGDO/lumyAOHdCsd5CaU6jqkSu04Bz9DydazL2M7IlH3EXHYDw6Aar1PuwPNiG4q2v
	9gZQ7xRgcOFtviIkoUta2UPUoaXiUFi6yM/Pisu8JwpbK3qE5Y+TJtoK7tpOzU1s9qVvTIMnG9g
	CVKhUh8B2fddU7G3kgsrVek5Bk5Tad/5R1XJyc2mCCjSD9SkK43RsXNMVlhnR6qjdTJAThxxC4i
	1RAnEPA9ccFcgXbzm1aXxiXZ+RPN5u24AwPA6oIQMfg0knWotw03gqeOHRyOaLVYXQsl9veXq5x
	12/UWDcTZie/RiCem1yrnQ6KJLNTBlZXpFScPq6jifQ4mvKiG/4GHjEY7pON6nsBD+qElZBZUl3
	HCxXZkX5pywDIC4pA9TpnUEA31uqR0fu6zqoJuxV0udaJKW4AF5RQ=
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id
 5a478bee46e88-343fdea2578mr10273152eec.28.1790688142453; Tue, 29 Sep 2026
 06:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
 <20260925-apple-m3-nvme-v1-2-5e832e2f4aa9@jannau.net> <20260929-debonair-busy-hamster-be2fda@quoll>
In-Reply-To: <20260929-debonair-busy-hamster-be2fda@quoll>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 29 Sep 2026 15:22:09 +0200
X-Gm-Features: AclHuK_jJoonbrdcWTM4pJ6-SA0D9nOYSb3Qq4ribSs7qfnRaIDq9x1ahszR1jY
Message-ID: <CADo9pHg2JyGyOA=_6orXdhDwj7NaKRBciyQMG2w7fQcPm0MNwg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: mailbox: Add Apple M3 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Keith Busch <kbusch@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, 
	linux-nvme@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

https://youtu.be/TPwe53kCJuM

Den tis 29 sep. 2026 kl 10:21 skrev Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 25, 2026 at 10:22:49AM +0200, Janne Grunau wrote:
> > The ASC mailbox on Apple M3, M3 Pro and M3 Max/Ultra is compatible to
> > the mailbox on M1 ("apple,asc-mailbox-v4"). Add their per-SoC
> > compatibles "apple,t8122-asc-mailbox", "apple,t6030-asc-mailbox" and
> > "apple,t6031-asc-mailbox" to its dt-bindings.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>
