Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AE8F58
	for <asahi@lists.linux.dev>; Wed, 22 Mar 2023 17:11:40 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eh3so75804334edb.11
        for <asahi@lists.linux.dev>; Wed, 22 Mar 2023 10:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7O5naL/QC03iyN3hnxTSunyzGFl7TA2WgnZix5oaF0=;
        b=hqSfmUJ25LPjBeadUydq235vjQ+9L0SJwofobPJiFji/jzXiyR4HjhnODKm/nd3VYE
         hR22MPykPQVbvOhAn0sPCMu0Rc/3+I3WzHMbT1k02DpO3t7Q5hAxEOPI2SNcD0FOnORi
         MlJ0fBSCwMsMSmpG7oJ6XsvrtdDSU2mf2P1ERVKkvu864XxMillznYrQ89knwI8+EGzk
         gB19zhGZna0A0owTXj/27ztxW9LQqVHDWxlAaMl6kkvRa5QbU3njBdYS0sP2T/wptnoV
         aeOLeBSkI2ExgWpuJdoqvTIQIvdIFrGJlrPDn2F6oZDw3M1XXRGemwuRJq+Eh8M8XRf/
         rLXg==
X-Gm-Message-State: AO0yUKVLTOIGBRR+7ZNAauFfsphsvRu/beL1lVWdj1cCqJ5bmv1WsULB
	tnwZMCAlDJqZwEPScYzpN6eSnWnIt5Ibd2yR
X-Google-Smtp-Source: AK7set/M4RWI1fJFVVlJvWesomeXlAdzlVfc/hnPHGX92f0+zpPHdn/cVhJwqi6FP2ON93Orkqt/wQ==
X-Received: by 2002:a17:906:4e50:b0:931:2f96:819c with SMTP id g16-20020a1709064e5000b009312f96819cmr7593612ejw.27.1679505098723;
        Wed, 22 Mar 2023 10:11:38 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id e9-20020a17090681c900b008cf377e8795sm7492617ejx.199.2023.03.22.10.11.38
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:11:38 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id ew6so12842079edb.7
        for <asahi@lists.linux.dev>; Wed, 22 Mar 2023 10:11:38 -0700 (PDT)
X-Received: by 2002:a50:9995:0:b0:4fa:3c0b:74b with SMTP id
 m21-20020a509995000000b004fa3c0b074bmr3925387edb.3.1679505098079; Wed, 22 Mar
 2023 10:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321180610.2620012-1-neal@gompa.dev> <20230322143338.GB2169647@perftesting>
In-Reply-To: <20230322143338.GB2169647@perftesting>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 22 Mar 2023 13:11:01 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_YvwLSgx-WNmMQTh2EzOn+HYFbBYzhcBygM1UPSrSwew@mail.gmail.com>
Message-ID: <CAEg-Je_YvwLSgx-WNmMQTh2EzOn+HYFbBYzhcBygM1UPSrSwew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/1] Enforce 4k sectorize by default for mkfs
To: Josef Bacik <josef@toxicpanda.com>
Cc: Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, 
	Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.cz>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, Asahi Lina <lina@asahilina.net>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 10:33=E2=80=AFAM Josef Bacik <josef@toxicpanda.com>=
 wrote:
>
> On Tue, Mar 21, 2023 at 02:06:09PM -0400, Neal Gompa wrote:
> > The Fedora Asahi SIG[0] is working on bringing up support for
> > Apple Silicon Macintosh computers through the Asahi Fedora Remix[1].
> >
> > Apple Silicon Macs are unusual in that they currently require 16k
> > page sizes, which means that the current default for mkfs.btrfs(8)
> > makes a filesystem that is unreadable on x86 PCs and most other ARM
> > PCs.
> >
> > Soon, this will be even more of a problem within Apple Silicon Macs
> > as Asahi Lina is working on 4k support to enable x86 emulation[2]
> > and since Linux does not support dynamically switching page sizes at
> > runtime, users will likely regularly switch back and forth depending
> > on their needs.
> >
> > Thus, I'd like to see us finally make the switchover to 4k sectorsize
> > for new filesystems by default, regardless of page size.
> >
> > The initial test run by Hector Martin[3] at request of Qu Wenruo
> > looks promising[4], and I hope we can get this to land upstream soon.
> >
> > This is an update on the initial RFC patch[5], which addresses the
> > documentation feedback from Anand Jain.
> >
> > [0]: https://fedoraproject.org/wiki/SIGs/Asahi
> > [1]: https://asahi-fedora-remix.org/
> > [2]: https://vt.social/@lina/110060963422545117
> > [3]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9cec=
a20263@suse.com/T/#m11d7939de96c43b3a7cdabc7c568d8bcafc7ca83
> > [4]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9cec=
a20263@suse.com/T/#mf382b78a8122b0cb82147a536c85b6a9098a2895
> > [5]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9cec=
a20263@suse.com/T/#t
> >
>
> This all looks good to me, you can add
>
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>
>
> I've got a mac studio on the way, I'll add this to our CI testing to make=
 sure
> we've got good coverage of this code going forward.  Thanks,
>

Since we've got three Reviewed-by tags (you, Qu, and Anand), do I need
to send another version of this to land or can this land as-is?

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
