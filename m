Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB21A4F14
	for <asahi@lists.linux.dev>; Thu,  5 Sep 2024 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569597; cv=none; b=OjqEyutTN2ICySKxzM2amazLs5cPA58TV0qDgb6R3EmtAdixZCx4ptiTiKthl6jeiojgryAXnWsSeJsnvumij5KrOxE8YH1By078VNiTuiNJ65QEsgyVYV/KzWWCpo2PhlUkeb+qHvoilq9F91qJFa0R9U7VB+/TbR/OrB4JV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569597; c=relaxed/simple;
	bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lX9RaayyOssddyBIxTVX7iPpKBmmIGczKJ4d5iY/Om4Z4Xz2XZH+sZXAn5w5igfedkM+l0+CUP9ENXQEjaaUfvJLTwhiSt+sK3DKkbvYrJNFaP1IWbcSGXYWQR4hzFSZVTCRg+08zC6ikCBA7Aid1Mf9i2jvqKc/ioz9+8rfTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2cE88HO8; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2cE88HO8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4567fe32141so30121cf.0
        for <asahi@lists.linux.dev>; Thu, 05 Sep 2024 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725569594; x=1726174394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=2cE88HO8Q6GZqAsf5ciR1PoWfQ/N6IoNXroV7u80s84t7NWzwH/1M3GUgkXNGNxqsI
         ygkbIB75iU3KWJodim5vDiSSRFFhQGVRt1VpEN+SU/h75TEZLpGTWfZZS7lMM0TnuHZ0
         lpHp5N/Msg2IIssect6zG9/mg17suG7iJThH6NiYW+UTBcorNaOeBGJR59dM3WsVJ1+J
         YREh04BudhGsJbsUzjLdCaPiMvlr0ujBGbE98vQLHsdb2mJu7yA+O5QdN+hUqQk7mFv7
         KI6ylJOVRYT4uWGCiM+HVACQPMaX7bv9AumP6vTmu3hM1Xij1Hhq2w2r3uI+jEZhvboO
         mPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569594; x=1726174394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=Ht5l5ObO5SKmeynvUxB/VTErnssY7OSjJGBYkTK/fQVwRQLk+Ivzk9KNJUKy06ywdd
         IHm2/B07hnW7YEMg9jiayzEcpsCTX7qiBIJn/e0tOe4/PH6fIJVxYOK/ujlhRFwXskyT
         gG0YeqHyCEWfIX5YFSDCaFc9q7MEtZX/h0pZN5J4a2TXeUuff2MK2869x8Pi0X1I6pV9
         rYF9VMUzUtSq4fvS5Mbal4JlgXysJdHHAMMXxk/7oIZbfygDCzy66TqwSPI9fPiw7XSr
         vgcMn9zyNOSMb+AWCdwZwLwZuo+NbzgQY6ivchjWmSC2OT2o1nqZOmFJ98ykfZt/BxRM
         ysbg==
X-Forwarded-Encrypted: i=1; AJvYcCVFgytl9KgHSZG3UGP2+jKTgxRTZtmcAFLZCZO/5xqFo1H9ZInQkR1vRKwK9qWnPilxq6rL9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYvx5zxgMdKZesiipo/NdYh9aB0pKEQqpdi6qBCnwdLK9wzn6v
	4yJLPoXcRHRMDD8tSiB5JJc5MUaGNACKVHsfvzo9m5W5BSHhPFYmeUM7Vi5+RFko3FdeCQHN7tO
	5+mirhvjMDoQKWkTp6dzs5Qvn4YsZKVyBeloY
X-Google-Smtp-Source: AGHT+IEyDq3JrzaEs03Q1q6474Lw72SpaaWbS1WNHPASK98Yp/ym0+RHgGQfwZR8C+mk4SWq/i0+5v5gojSd3ZhoK8I=
X-Received: by 2002:a05:622a:1486:b0:453:5b18:817 with SMTP id
 d75a77b69052e-4580c4346c9mr987391cf.6.1725569593602; Thu, 05 Sep 2024
 13:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
In-Reply-To: <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 20:52:34 +0000
Message-ID: <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 5, 2024 at 2:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#include <dwarf.h>
> > +#include <elfutils/libdw.h>
> > +#include <elfutils/libdwfl.h>
> > +#include <linux/hashtable.h>
> > +#include <inttypes.h>
> > +#include <stdlib.h>
> > +#include <stdio.h>
>
>
> Could you include external headers first,
> then in-tree headers?
> (and one blank line in-between).

Sure, I'll reorder this.

> Also, please consider using scripts/include/hashtable.h
>
>
>
> How about this?
>
>
> #include <dwarf.h>
> #include <elfutils/libdw.h>
> #include <elfutils/libdwfl.h>
> #include <inttypes.h>
> #include <stdlib.h>
> #include <stdio.h>
>
> #include <hashtable.h>
>
>
>
>
>
>
> If necessary, you can use this patch too:
> https://lore.kernel.org/linux-kbuild/20240904235500.700432-1-masahiroy@ke=
rnel.org/T/#u

Thanks for the patch! I think this would otherwise work, but I also
need jhash (or a similar hash function), and I can't combine the
tools/include version with this, because it ends up pulling in a
duplicate definition of struct list_head. Would you consider adding a
hash function as well?

Sami
