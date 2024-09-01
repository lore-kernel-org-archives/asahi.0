Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9D144D0A
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725187871; cv=none; b=lDhf4XrKnLLDv4DVrKvRvDh1vIsZ8auibshqYt+vHPord7CBs7r1A7ZtPcdb0blIgdmmsfWa+gPqEFy3MYDdB8fSgbl1MII3ntXSRGuEV4TsydZrb9S+JcFv9s74T8akbbh94uSplPvabHKSGIQ9lmAw+MypLR4GUv1n9f0ER1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725187871; c=relaxed/simple;
	bh=tEod7l1TOEILAYrzrtgJeK+5LXqWOv/BlAH82sxk6Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxsCVMerBYXgssYjLYgqO3fw0THOn1SmUvE0iTedGGOwcssW9phIjJRZuQDUms96KUSmYiW334EJxKSbQodmAQK9ciwuRRKM6RZbLzOU47pHCqjeZ7OCQQnur2FIYetl7CYTEnW87GOJucwfgqiGUYTmQs+NhF3CM+angOvVmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUaBjzyo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUaBjzyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF38C4CECA
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725187871;
	bh=tEod7l1TOEILAYrzrtgJeK+5LXqWOv/BlAH82sxk6Ag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iUaBjzyowjcs1/lFuLVGFbd8r1IXSHuD8cNaSC8PxeLC3z0su1gpO4sR0VHhVEOCb
	 bJmW0hiIPsKF31a8gxb75R98/Ue5fGxlhfosEYJVWgatK6cPQ8wBKRCCXdnQtjcJD0
	 TsMxEbWF/31yKDLoMgUomTJgtXuKP2alj8/RPAvwarhcqjNrS2DdjkQnwWy5tBfEdM
	 +P/rb3xiftTcvd/WpoaHEHmCW6yUv3V2HjiQznClU3usw4ctj/yf08Aw3wjlfwjhO9
	 opJDCWaYgBI386Td+kBBMlzcVuSTL+iq0F2bxXFupXGZq2xiGJLnKHBK4kEY6ia6st
	 f87Lsv4TI6aTQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f50f1d864fso37127471fa.1
        for <asahi@lists.linux.dev>; Sun, 01 Sep 2024 03:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb0RxXB+Xt/kQFhTk2N/aTKZJD8eslPNiS5ksdBZMqnfhcCSIBha40LDeLwPN6JcwXzd9a9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbDZCBdF+L3ux+MX05TDZdJeeisR/MNLvIU05jYWWU3v57xtEd
	sYASOYFf6dZF0xss8aqm8Y6lKv07lYfwjYfNgylZkIOZ2/77YFeznma/4ODDu7IFp5c+FGKiDt5
	FW4dibw9/9Iv7B/cO89GncV3VYkU=
X-Google-Smtp-Source: AGHT+IFj24VJLRe5mGXDbBsTIFHvsslq2fVan6e2JAmdiLbQYfHXryZyyS7TDjp35LE1bYWF/nTCJRQscAz0eiZm6cM=
X-Received: by 2002:a05:6512:3d07:b0:530:e28a:3c17 with SMTP id
 2adb3069b0e04-53546b34715mr5450093e87.25.1725187869747; Sun, 01 Sep 2024
 03:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-39-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-39-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 19:50:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
Message-ID: <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] x86/asm-prototypes: Include <asm/ptrace.h>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> <asm/ftrace.h> refers to struct pt_regs, make sure it's visible.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>


Then, why don't you include <asm/ptrace.h>
from arch/x86/include/asm/ftrace.h
instead of from arch/x86/include/asm/asm-prototypes.h


And, this patch can get in independently.

You should send it as a standalone patch
to the x86 ML.







> ---
>  arch/x86/include/asm/asm-prototypes.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm=
/asm-prototypes.h
> index 25466c4d2134..c82e68c8b7c2 100644
> --- a/arch/x86/include/asm/asm-prototypes.h
> +++ b/arch/x86/include/asm/asm-prototypes.h
> @@ -1,4 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ptrace.h>
>  #include <asm/ftrace.h>
>  #include <linux/uaccess.h>
>  #include <linux/pgtable.h>
> --
> 2.46.0.184.g6999bdac58-goog
>


--
Best Regards
Masahiro Yamada
