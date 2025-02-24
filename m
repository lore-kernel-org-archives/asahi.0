Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6261C84D1
	for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740433767; cv=none; b=bcg3vw6PQjgQuPH1wcCp1nVLf5RmFaK2q4K0ouCSUyv1papXpV0fBi8JBYzO5uRSquhkQ6IwRBUDFl8KIBV2NcK8KZNIXbTQBSOxtL9rtGX8NWQyjtYuETl2+pzYOHBHCeVkdBgNFrRiiTV45agV/2Tebsqqb7CyxDS0mTt/c2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740433767; c=relaxed/simple;
	bh=J215scXfZhnZlzH787iKk4vILxSSZ4u+BZkCxzcaCgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvWhEeLIZe7V1qjYFe5/7/F7iZ7qg6QnMLlJO0pUVxMz0a4qYDR3zDtpiQvTHBFaFTyjIhEKNKtUW6o7DlZsxr2jpSQfRl1OGvZNtHYSfr2NxqB4g48kBiWjd8Vu6ffNiAKb/XcwsQ6FP0UcywwqKWactw/pKDXmy5pL2CcfJck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso716179866b.1
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 13:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433763; x=1741038563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=;
        b=wEYNkB6VoXNYNgKRf3g8ytIkk8Hi4A8VeduOuYt+Re8TAEsaNLmetrbQdDWhD1WfOd
         VMDp/AKn05VthWux9NOL9mlytL7uk7a/HGeQCyafxRPCIV40kUuvL9PcrfXmn0W7q2dK
         W9jOMK5FanfCdkYqtuP2ynTVN/Bz4SnYr+po1XLgAYhrhh7eQFpPzwo1I7pZ8gD3rC1j
         pEXJPnpkzKySnY5RWF+un1gRZ2vvz7EkjqABgcwVXyvML1kCejgjFaqnnQE4RkKncD6F
         kbpB4gy0fkj/4RW/EYAPn+K+ztghv/uS1kW+mk48VnWzzY21lhXHbt7qRDyrcPMNtTvu
         3ilQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjL6B5HBQzSEgDFSWJhQ++lM3ML6LXVihbeFDtapOiEahOk+XmIB/LzN5XiLJgdN4+3WH7ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqvJHBr3/SYTlP80fTQfW3aren4W1kySlyoSwTr2fNQPYuLVlz
	bY8hT8I7FPuaHjxzOgmezZlVzeKbgYtmc9cvNdQg2egmSfHy+WE3bu14vG7e1Qw=
X-Gm-Gg: ASbGncsGIssP1yJUuCZsss3qoR13D6PieA/dNltJehTFQMpW31nxuQjBu5HrcRBAdTN
	tbfE4Sa3O81FTwxgH3zw3EXJ565xk3IMPKyZSENpTeTiHyXZKVvIv7eBaRBs5eD/KTs9LLCxrNr
	1ZW/+/fWekE1LVOKO7b0EUdeNraFAYRdZcFN5WyQwmhYbtHN2Qc6KJaMGNs+2csgbfPzZdpOAVY
	cARh3xVFeJwxtsQ1UHQaq4v2C7Tp6bDU0ZGUwXShSqnqABJBSJL1VISLhWL5uo5J4SwSIaOvX2Z
	XvNf8o4ivwaeRh6nQeHhgC15R8Umy9zjoxTq8QUq41bodApll8kQkqaX
X-Google-Smtp-Source: AGHT+IExFGPn8YIrEqnUK3bho8a2A3qQFAOqZrPyY+VdBaQFxuQSFJ2waBQ3rWRz66lj0KlxDmXnlg==
X-Received: by 2002:a17:907:6ea5:b0:abb:e6e1:22c1 with SMTP id a640c23a62f3a-abc09bf55bfmr1723882666b.35.1740433763059;
        Mon, 24 Feb 2025 13:49:23 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cd5680sm28253566b.32.2025.02.24.13.49.21
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 13:49:22 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb8d63b447so633072866b.0
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 13:49:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC91Xzn6hWtkZQ2duwPzeNewNQd7ZQKU2YVjSQELgZ6ZM5q8r5tx1HjoeVNwRTjVi4rBrh6w==@lists.linux.dev
X-Received: by 2002:a17:906:308c:b0:ab7:ec7c:89e4 with SMTP id
 a640c23a62f3a-abc09a0a2c1mr1144051266b.21.1740433761758; Mon, 24 Feb 2025
 13:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 24 Feb 2025 16:48:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
X-Gm-Features: AWEUYZnTgmy8Wh3cNs6Z5TiDd6mBDwseYtK_5ZJpLXo_D79Innf9WD-b_IfXjLU
Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 8:38=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---=
------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
>
> Best regards,
> --
> Sven Peter <sven@svenpeter.dev>
>
>
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
