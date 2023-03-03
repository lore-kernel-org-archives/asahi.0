Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C579D8
	for <asahi@lists.linux.dev>; Fri,  3 Mar 2023 16:24:55 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536bbef1c5eso51851187b3.9
        for <asahi@lists.linux.dev>; Fri, 03 Mar 2023 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677860694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrWT0Uw+FmkZpoCNK5xclsdtV6ORVe/QF51P6fxoy6I=;
        b=AKX5M2ADiE0XRCcF0QqIDnn7/xUSgfvWFXCSysEpwreGqhYkMScsokJIqensG60TIW
         NPsBDuIpB6g1mJmgdUem0u/dLdniXYn4sEUhOvtcJ8AikZbPMx0lNVgwkIIEw0PmaDIi
         5ZrmRSGEMbUizmMd4v2MFUtdP7NezcjlPymhufL8esz/kXu0GRcBw7mVx+Gn1WmDQeGo
         4rILke1wk3UPjlvAS/Mwobx5/sl2Rf2JX7YKs2EDKFiC0jaEsM8wTft7FFPSbSIKr6T2
         689Gf54yuQeDMJUOKuDwIYF/clFO1tX8b0vuLtN8L2JMsv8nxibouiqiP19p5/8dxk9M
         1tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrWT0Uw+FmkZpoCNK5xclsdtV6ORVe/QF51P6fxoy6I=;
        b=jkjzBhWWyEhaa+3rNZxgSTvBOy77FG+biyFNyu3b/3vUkboGldPnRL9HYiDedYFOCW
         tIwvd34XVXMcT0ewp4BRNN3aYsI2hmzFT0czlmY9OKb/2B5jViBxDQfxVVsTeDflnW7h
         oyqgJR7dOowNij9b3sIaXM8Bovk+1eq8UnB37F0cGzGTX/fkrxaO9VWGbH4fNM6f8hjq
         7b1JiuuCW8dHbpyaAEsl0szyERWlfCUxvaDxlBTcjD+Aq4AQQEhV+APofjhRdRYLlZJG
         hwfzZIhgW0oDTjmW3DXhVY8lozLaVJGmDYqg/j8oCCY+yzqrDjm+Z6R/882S4CGUOj94
         Czbg==
X-Gm-Message-State: AO0yUKWwNQMk06TwEu5qwwJOiuTQ72IKwtRhiSic8WbFxrXpjrzG4Chs
	OlhRFlX+tCRXtGlx7oWIx/3w8w3pN6YDy6QrWo0=
X-Google-Smtp-Source: AK7set++cGh53sL4B78QHoSD7Y+S1sNtTp+FFwFB55qUIU05r/eLmxDVznFkSmq/IML+/ZUDtRwnq04tuN+SHyvCh88=
X-Received: by 2002:a81:b61a:0:b0:52e:cea7:f6e3 with SMTP id
 u26-20020a81b61a000000b0052ecea7f6e3mr1285093ywh.10.1677860694320; Fri, 03
 Mar 2023 08:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <CAPsT6hnbAA_uCiVjST8VaPgb6TyfBq9nO2S7OPqJX3=YhzBD9g@mail.gmail.com>
 <BYAPR21MB16882541DC2DA7AB91E58A03D7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <Y+psCbPTfF9JkW2c@kbusch-mbp> <CAPsT6hkYqg2N6_Xf5aL2ijydTJfPYemUVKPZFGgdAik=DwTygQ@mail.gmail.com>
 <BYAPR21MB16887CE0FC5AFD717C741524D7A19@BYAPR21MB1688.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB16887CE0FC5AFD717C741524D7A19@BYAPR21MB1688.namprd21.prod.outlook.com>
From: Daniel Gomez <dagmcr@gmail.com>
Date: Fri, 3 Mar 2023 17:24:43 +0100
Message-ID: <CAPsT6h=HpDjgE42KRPk8SHHVQ9yPTVBpbGrxd1C9nPN=jWoqUA@mail.gmail.com>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>, Gerd Bayer <gbayer@linux.ibm.com>, 
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 17, 2023 at 5:05=E2=80=AFPM Michael Kelley (LINUX)
<mikelley@microsoft.com> wrote:
>
> From: Daniel Gomez <dagmcr@gmail.com> Sent: Friday, February 17, 2023 5:2=
8 AM
> >
> > >> value to be set.  In your example, I would guess the value of 512 Kb=
ytes came
> > >> from querying the NVMe device for its max transfer size. Ideally, to=
 support
> > >> 512 Kbyte transfers, you would want 129 segments (to allow for start=
ing in
> > >> the middle of a page as describe above).  But the value of max_segme=
nts
> > >> is limited by the NVME driver itself using the value of NVME_MAX_SEG=
S
> > >> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to m=
ake
> > >> sure that the data structure containing the scatterlist fits in a si=
ngle page.
> >
> > >
> > > Should be 128 possible segements now in -next, but yeah, 129 would be=
 ideal.
> >
> > Quoting Michael,
> >
> > >> the middle of a page as describe above).  But the value of max_segme=
nts
> > >> is limited by the NVME driver itself using the value of NVME_MAX_SEG=
S
> > >> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to m=
ake
> > >> sure that the data structure containing the scatterlist fits in a si=
ngle page.
> >
> > Yes, I can see that. I guess the 129 needs to be reduced to 127 (or
> > after Keith optimization patch to 128) but not when the device is
> > limited to a lower max_segments value because they fit anyway in a
> > single page?
>
> Yes, that's correct.   But "the device is limited to a lower max_segments
> value" isn't really because max_segments is limited.  The limit is on
> max_hw_sectors_kb derived from the NVMe controller MDTS value,
> as you have shown in your table below.  Then the max_segments value
> is derived from max_hw_sectors_kb.  For example, if max_hw_sectors_kb
> is 128 Kbytes, you can never need more than 33 segments.  Each segment
> can describe 4 Kbytes (a page), so with 128 Kbytes you get 32 segments.
> Then add 1 segment to handle the case where the memory buffer doesn't
> start on a page boundary, and you get 33.

I'm trying to understand and clarify this part. So, I found Keith's
patch [1] where he addresses (and introduces) the same case (quote
from the patch: 'One additional segment is added to account for a
transfer that may start in the middle of a page.'). But I'm not sure
when that case should be considered when we split an I/O. Is that
handled in bio_split_rw + bvec_split_segs functions?

So, for mdts=3D7 and max_segments being now 128, when can we see and
test that a transfer starts in the middle of a page and therefore,
that we need an extra segment for that? In that case, shouldn't the
split max at 128 - 1 (508 KiB)?

In my tests [2], I can see splits are made in chunks of 128 in some
cases. Whether or not these cases are page-aligned I don=E2=80=99t know but
I'd like to verify that.

[1] https://lore.kernel.org/all/1439417874-8925-1-git-send-email-keith.busc=
h@intel.com/

[2] while true; do sleep 1; dd iflag=3Ddirect if=3D/dev/nvme0n1 bs=3D1M
count=3D1 of=3D/dev/null status=3Dprogress; done

On Fri, Feb 17, 2023 at 5:05=E2=80=AFPM Michael Kelley (LINUX)
<mikelley@microsoft.com> wrote:
>
> From: Daniel Gomez <dagmcr@gmail.com> Sent: Friday, February 17, 2023 5:2=
8 AM
> >
> > >> value to be set.  In your example, I would guess the value of 512 Kb=
ytes came
> > >> from querying the NVMe device for its max transfer size. Ideally, to=
 support
> > >> 512 Kbyte transfers, you would want 129 segments (to allow for start=
ing in
> > >> the middle of a page as describe above).  But the value of max_segme=
nts
> > >> is limited by the NVME driver itself using the value of NVME_MAX_SEG=
S
> > >> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to m=
ake
> > >> sure that the data structure containing the scatterlist fits in a si=
ngle page.
> >
> > >
> > > Should be 128 possible segements now in -next, but yeah, 129 would be=
 ideal.
> >
> > Quoting Michael,
> >
> > >> the middle of a page as describe above).  But the value of max_segme=
nts
> > >> is limited by the NVME driver itself using the value of NVME_MAX_SEG=
S
> > >> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to m=
ake
> > >> sure that the data structure containing the scatterlist fits in a si=
ngle page.
> >
> > Yes, I can see that. I guess the 129 needs to be reduced to 127 (or
> > after Keith optimization patch to 128) but not when the device is
> > limited to a lower max_segments value because they fit anyway in a
> > single page?
>
> Yes, that's correct.   But "the device is limited to a lower max_segments
> value" isn't really because max_segments is limited.  The limit is on
> max_hw_sectors_kb derived from the NVMe controller MDTS value,
> as you have shown in your table below.  Then the max_segments value
> is derived from max_hw_sectors_kb.  For example, if max_hw_sectors_kb
> is 128 Kbytes, you can never need more than 33 segments.  Each segment
> can describe 4 Kbytes (a page), so with 128 Kbytes you get 32 segments.
> Then add 1 segment to handle the case where the memory buffer doesn't
> start on a page boundary, and you get 33.   I'm making a subtle distincti=
on
> here between "max_segments is limited" and "you can't need more than
> XX segments for a given max_hw_sectors_kb value".
>
> Michael
>
> >
> > Following the kernel code, I can see the max_hw_sectors_kb is
> > calculated using max_hw_sectors =3D 2 ^ (MDTS + page_shift - 9),
> > max_hw_sectors_kb is just max_hw_sectors >> 1, and max_segments is 2 ^
> > (MDTS) + 1 (simplified). Using QEMU (NVMe emulation) to be able to
> > change the MDTS, I get the following:
> >
> >   MDTS   max_hw_sectors   max_hw_sectors_kb   max_segments
> >  ------ ---------------- ------------------- --------------
> >   0      1024             512                 127
> >   1      16               8                   3
> >   2      32               16                  5
> >   3      64               32                  9
> >   4      128              64                  17
> >   5      256              128                 33
> >   6      512              256                 65
> >   7      1024             512                 127
> >
> > >
> > > The limit confuses many because sometimes user space can sometimes ge=
t 512kib
> > > IO to work and other times the same program fails, and all because of=
 physical
> > > memory continuity that user space isn't always aware of. A sure-fire =
way to
> > > never hit that limit is to allocate hugepages.
