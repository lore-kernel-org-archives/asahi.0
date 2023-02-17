Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229366AA9
	for <asahi@lists.linux.dev>; Fri, 17 Feb 2023 13:28:37 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-53657937c48so9019887b3.12
        for <asahi@lists.linux.dev>; Fri, 17 Feb 2023 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eq+vd5/u0vTPMlp0b3NDUReHDOice7k20Mvpv6BKlCM=;
        b=N1ATPKTsPkxU4bDMpbeYttTgSpaLiE7A0J/zCMsTT50RaO3NiO098ibH8fXAHL8A8p
         e2dqyLVp3ELa7WawK1KHQE7wpooFp7AjfgTelE2udkstcVhnO7VivpI/LdNGt6PCRuwJ
         5OKxmUbE8pUxloAqZRtDUrnGb9hrn0Wkj/5GYS6QOid1akwPSljRlqKtwgqkZ3ZABHww
         o6K1LIEMbLK1EAn8Yn57tg2jq3/IDPXko9DNsiWpRWCZ9HRzxsa6UPQO29tqBPCJSaTW
         hL92ku3F4VU7AHSJcAjLrIFziywe0ZVxtXnxlhHKKYdk9OHBZ0wWQmQNcCdviowsaNF0
         bpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq+vd5/u0vTPMlp0b3NDUReHDOice7k20Mvpv6BKlCM=;
        b=m8p5N+a6+sF8xoLsMCrD1yQiHLQYUR0Z4racgn3bEHfmTL27uwtyANV6apYlnWYugj
         GkZw3Ev3cA6fsEsadY38vimEaq0PthxEgjjxFHDV60r+mSZ3WMSf86LJgvaprNyDybeg
         V3l9MCaYQ3fQ5kVxbbcFKd4+DwBi/Qo5I2LxKfzJfssjmrPG0+8AjCpLjNaZ1jEi82K0
         kw2tFno085GUvXup5+FvnqwtGdVE+PrIgwSTjTb/KcmCcomhJL5d5jC8oUhmr578tIaP
         owashk9QYwUECQdx02OKZz9oM2oiM//u7Y16/6DFxqjnw9RkRq01hylqIm/DV5psPy9d
         uipA==
X-Gm-Message-State: AO0yUKV/mLFQp6vWQPSBF+a3BCLiEvP0JUtvvYyxWDS/EjYq7x7iYqy4
	Wib41qdIv/Lo66eJIeYA2+GP8U5aXpQ/okJg6BI=
X-Google-Smtp-Source: AK7set+2S9sIoThX61XwxrWE5zE9Tsy5goZZcmLIa8T3C1STZ5MGvaivN5+KsgubDeZg3NYYIIpTriUQWAUUcABVmm0=
X-Received: by 2002:a0d:e3c5:0:b0:52f:3bea:8ce3 with SMTP id
 m188-20020a0de3c5000000b0052f3bea8ce3mr16423ywe.302.1676640515977; Fri, 17
 Feb 2023 05:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <CAPsT6hnbAA_uCiVjST8VaPgb6TyfBq9nO2S7OPqJX3=YhzBD9g@mail.gmail.com>
 <BYAPR21MB16882541DC2DA7AB91E58A03D7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>
 <Y+psCbPTfF9JkW2c@kbusch-mbp>
In-Reply-To: <Y+psCbPTfF9JkW2c@kbusch-mbp>
From: Daniel Gomez <dagmcr@gmail.com>
Date: Fri, 17 Feb 2023 14:28:25 +0100
Message-ID: <CAPsT6hkYqg2N6_Xf5aL2ijydTJfPYemUVKPZFGgdAik=DwTygQ@mail.gmail.com>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
To: Keith Busch <kbusch@kernel.org>
Cc: "Michael Kelley (LINUX)" <mikelley@microsoft.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 5:57 PM Keith Busch <kbusch@kernel.org> wrote:
>
> On Mon, Feb 13, 2023 at 04:42:31PM +0000, Michael Kelley (LINUX) wrote:
> > Ideally, to support
> > 512 Kbyte transfers, you would want 129 segments (to allow for starting in
> > the middle of a page as describe above).  But the value of max_segments
> > is limited by the NVME driver itself using the value of NVME_MAX_SEGS
> > defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to make
> > sure that the data structure containing the scatterlist fits in a single page.
> > See nvme_pci_alloc_iod_mempool().
Michael,

Thanks for clarifying. It really helps. Also, it's fixed after
applying Christoph patch [1].

[1] https://lore.kernel.org/all/20230213072035.288225-1-hch@lst.de/

>> value to be set.  In your example, I would guess the value of 512 Kbytes came
>> from querying the NVMe device for its max transfer size. Ideally, to support
>> 512 Kbyte transfers, you would want 129 segments (to allow for starting in
>> the middle of a page as describe above).  But the value of max_segments
>> is limited by the NVME driver itself using the value of NVME_MAX_SEGS
>> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to make
>> sure that the data structure containing the scatterlist fits in a single page.

>
> Should be 128 possible segements now in -next, but yeah, 129 would be ideal.

Quoting Michael,

>> the middle of a page as describe above).  But the value of max_segments
>> is limited by the NVME driver itself using the value of NVME_MAX_SEGS
>> defined in drivers/nvme/host/pci.c.  The value of 127 is chosen to make
>> sure that the data structure containing the scatterlist fits in a single page.

Yes, I can see that. I guess the 129 needs to be reduced to 127 (or
after Keith optimization patch to 128) but not when the device is
limited to a lower max_segments value because they fit anyway in a
single page?

Following the kernel code, I can see the max_hw_sectors_kb is
calculated using max_hw_sectors = 2 ^ (MDTS + page_shift - 9),
max_hw_sectors_kb is just max_hw_sectors >> 1, and max_segments is 2 ^
(MDTS) + 1 (simplified). Using QEMU (NVMe emulation) to be able to
change the MDTS, I get the following:

  MDTS   max_hw_sectors   max_hw_sectors_kb   max_segments
 ------ ---------------- ------------------- --------------
  0      1024             512                 127
  1      16               8                   3
  2      32               16                  5
  3      64               32                  9
  4      128              64                  17
  5      256              128                 33
  6      512              256                 65
  7      1024             512                 127

>
> The limit confuses many because sometimes user space can sometimes get 512kib
> IO to work and other times the same program fails, and all because of physical
> memory continuity that user space isn't always aware of. A sure-fire way to
> never hit that limit is to allocate hugepages.
