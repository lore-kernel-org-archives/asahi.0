Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96321FF36
	for <asahi@lists.linux.dev>; Sun,  7 Sep 2025 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287741; cv=none; b=BfZn08AFxoVqef5R+yvj0NNyFaVc/UMuEfm0lMeXgcJmB4160Amn/VCOX/euuo4pW1mBnt/PRO5UDtygD6Epx7TjDDMGcGCBg39RZnzA0mdXVpkUdp6GNpGOb9n5fvWeMZamnhrirA3XDaeNpL5b1FojXIvV4YyGtGoQM9FbD40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287741; c=relaxed/simple;
	bh=qC3LDgn0QXsjdpMpUjymiw5zBmyrBgFV6iffyCRgGfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HREFRYo1zlxEP1G6aF67HN8agRtn8MzIHXk7I7NMr9x0yGFVm04TiLMsdZINwGFmk2sY12vPYgj03zN+9iTXZ5FT2KVyb6YgqEhIpVcQu6aOrKMNapZH9KYRuyqERlKfa6COz2Y0AeJ9umQNi8MjJ6g7KL94kYTcjPW8W5siMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6237202020bso2240539a12.3
        for <asahi@lists.linux.dev>; Sun, 07 Sep 2025 16:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757287738; x=1757892538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F76zI8GwRW6lnDcSssWQ9O3Kr1qpDNaM13i6btYtNGU=;
        b=Jq07f6ha66f6lWwbajcwl6DvEbR8/JKKuHxcmjqLu2VVnppSyBit5fBXhDLYeW4sUl
         gpc5uYmnZyax71mM8Tm9g5nH1lo/eoPVaxcD61TqqXHdpG6WBn1SehswllJ72zyd7A7x
         3j6kD6piuQcNsjbWn2nC8JIew0k9JVmYCAIsfYYWQnNj/v3I4oQLjrJ2Gn5W7hTe0sYC
         wmCP15AEMOFYmKTaP8LKfANRXtfK0aW9WyOwrkz3Cq5ZiG7wldRgzYE1GFd0YxCxv7IA
         tOt3DxnnAPfAi9lyO5JOHWb6zmGD3mKmgLlQuShljuHUKqgt6a9mR6HOgZDdod/tFZPj
         41yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpESXsGfBaydDm20QF3E6nnt5zmDCL5szdtXzXjaay8lXVt11IHnLlSd7OhPl5FdQ8D8myeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxQVheUHRMMRI/xgjPxQV7FZ0D51Hhn+LXIWUBUI1AB8lfJbIO
	n543SPPGDHfeUQlAbnfTVxXP6NxVhhu4ZuR6CAvSHe5mLy2Hzm6HNLqotA850/w2338=
X-Gm-Gg: ASbGncurU1riXxjaiTKjH2dD0m67D3C6daFbz31Uu5hkikWEnd3JQbQLfhEGrXNattk
	7rwund++c2CZSCoo4wQx6Tc6XJBvHWw2WrAcXh2ln298E/SJ0U5zcfUZKAWdpSv/3onoi/hgde/
	6+kWPedo1kdfhLzIJKRHtCzj9v1ZjV2wi5+LjSNWg05+X/aFul6ZkU2EoRhpcuTnxIYO/iKRNSC
	Aaw7gFHZOcjuD8Lqkcd1BOLxBQU8QekfduitN3HcOVy7sD5wklXUtUnZTmBOZio8KV1AvQF8vfN
	4TwF8lF4uWEeEhuP//QZJFou80AL5doA6utd/5WShpYA28k7W48k/g9kykCtKf6yt8/sj36tHcL
	lmY1xepWp8bqW1kAKrF1MkLuoQK+PMQLBM5nVFYitH56CYbZ27QNytQX3dtDxnH1YABzUDaP02W
	r24vgBOf1hLx0VaEoRpr0=
X-Google-Smtp-Source: AGHT+IEN/2c65OfrZKXtrEPHvW7KhII+8uMjTE0AT9zLDKxX6YKiH9j6qOtvV0rUmLiDPperHRLtbg==
X-Received: by 2002:a05:6402:270c:b0:61c:1a89:5d71 with SMTP id 4fb4d7f45d1cf-623788338cemr5530662a12.36.1757287737916;
        Sun, 07 Sep 2025 16:28:57 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5622f0sm20645671a12.51.2025.09.07.16.28.57
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 16:28:57 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62221568039so2693534a12.0
        for <asahi@lists.linux.dev>; Sun, 07 Sep 2025 16:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/8Kn22vKQ8iYJOfpaw0xc7V5cgdMQWRAjdJozIWxmtLUl7InAKuysLeLchQPgrNs1KnpQIg==@lists.linux.dev
X-Received: by 2002:a17:907:9708:b0:b04:848f:a0d4 with SMTP id
 a640c23a62f3a-b04b13d2146mr575971366b.13.1757287737210; Sun, 07 Sep 2025
 16:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250907-kernel-retirement-v1-1-e6f4b2eadb88@rosenzweig.io>
In-Reply-To: <20250907-kernel-retirement-v1-1-e6f4b2eadb88@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 8 Sep 2025 01:28:20 +0200
X-Gmail-Original-Message-ID: <CAEg-Je_HNBPwWgm3sS9JJh+43wyo-QSjr1FKKJq22VcuF2cxVg@mail.gmail.com>
X-Gm-Features: Ac12FXxHcnYbJm2cztwXph6HDZ5s0fwABHYoAep7isIx_Mvof56FMZykcTuLhkY
Message-ID: <CAEg-Je_HNBPwWgm3sS9JJh+43wyo-QSjr1FKKJq22VcuF2cxVg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove Alyssa Rosenzweig
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, sven@kernel.org, 
	j@jannau.net, maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 12:56=E2=80=AFAM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> I'm moving on to other projects [1] and no longer wish to be copied on
> kernel patches. Remove my MAINTAINERS entries: both related to Apple
> driver support. So long and thanks for all the fish.
>
> [1] https://rosenzweig.io/blog/asahi-gpu-part-n.html
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd7ff55b5d321752ac44c91d2d7e74de28e08960..3c10a189421c9d20247ad1546=
ba4af31556c87cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1845,7 +1845,6 @@ S:        Odd fixes
>  F:     drivers/input/mouse/bcm5974.c
>
>  APPLE PCIE CONTROLLER DRIVER
> -M:     Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  M:     Marc Zyngier <maz@kernel.org>
>  L:     linux-pci@vger.kernel.org
>  S:     Maintained
> @@ -2364,7 +2363,6 @@ F:        sound/soc/codecs/ssm3515.c
>  ARM/APPLE MACHINE SUPPORT
>  M:     Sven Peter <sven@kernel.org>
>  M:     Janne Grunau <j@jannau.net>
> -R:     Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  R:     Neal Gompa <neal@gompa.dev>
>  L:     asahi@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250907-kernel-retirement-f11b99161435
>

LGTM. Thanks for everything, Alyssa!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
