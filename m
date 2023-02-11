Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DEE10E3
	for <asahi@lists.linux.dev>; Sat, 11 Feb 2023 09:38:56 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-52ec329dc01so80813547b3.10
        for <asahi@lists.linux.dev>; Sat, 11 Feb 2023 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gRTYTcrvPKL/Cxg5QRpZsjtHzFYdNvEF9N2GChXvYEo=;
        b=ZTZRQY7oE7phlVmxewxRUPUI+P1vdOYq1dFFS8dERRMS+7U3ijR/g7aI3Zl8HvyQBf
         7YtK+85BnJ7OT6XwWMznDIouj2OkiPsUWeWMKg4HzXveS9y89JlcK9Gu2QNYn6QjFSVq
         CXgCuKI0kYQAw9CpiC/u3P70P+JAbxdZ++/ABLYOGd5gSsx14bO6ZB8VhWoYJ01oVuZs
         88ZeAh5SOyU6OeynGt0JvfpmZsabc9yf6EEcKC5aFqQ+t/cCGGTGkecKXtpSFnSSDE3u
         V33WZEwQon37PR06Lamoqv5s+IqiRvp9B7N1bIB6OXhftgWm9bKsCATZcl2Wc5E5aQxb
         qT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRTYTcrvPKL/Cxg5QRpZsjtHzFYdNvEF9N2GChXvYEo=;
        b=bWA+rv+T3S8L+Lr4nDvYKxksL0u9XA8UrfV0pYqeLOoeq+NZcd3dbY6drPE0God8v3
         VosNPzii5wiELz4Zgx7u87pEboEm88K0m19r4Brk3ILTyCpJuMSLxY6xXSD6E9Ci0fKv
         b604IXtwhL4EatJOO+CQrLeHYpMwkdJ3BhR0p28+ooqYNEonUnv9e78m17DG4V0gmYiC
         Kds9LN00y8jx+rWaVUkVm9DU0Lm+mVRGHrcITnamCiQzM30SmZZt2C/DeBInDGNv/LqU
         pL45U8G599EbnGnCLXcgZf7nZPef/+eHyeeHzOVhesiB/s38jQBlZ7A8955sTAQSPTaP
         QVxw==
X-Gm-Message-State: AO0yUKUbFpOdu5vtxBQziLxuPb2fNWIhJe7fsUGHMrrYy0attFF/rCgv
	h+r7UUJ2MfOkPcdX0TSMiH6v97p6Oo0YHrsYFIs=
X-Google-Smtp-Source: AK7set/xCREtnGpO0BL6e44eU1IhJyDuyat66bJWwDH0149Zp6C4vKWJUIENtvb+Nlspvw9I8grAaaH92Optvzx7ZHs=
X-Received: by 2002:a0d:e401:0:b0:506:396f:bb17 with SMTP id
 n1-20020a0de401000000b00506396fbb17mr2109378ywe.486.1676108334984; Sat, 11
 Feb 2023 01:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
From: Daniel Gomez <dagmcr@gmail.com>
Date: Sat, 11 Feb 2023 10:38:44 +0100
Message-ID: <CAPsT6hnbAA_uCiVjST8VaPgb6TyfBq9nO2S7OPqJX3=YhzBD9g@mail.gmail.com>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Sat, Feb 11, 2023 at 6:38 AM Michael Kelley (LINUX)
<mikelley@microsoft.com> wrote:
>
> Commit 3f30a79c2e2c ("nvme-pci: set constant paramters in nvme_pci_alloc_ctrl")
> appears to have introduced an error in how max_hw_sectors is calculated.  The
> value of max_hw_sectors is based on dma_max_mapping_size(), which indirectly
> uses dma_addressing_limited() to decide if swiotlb_max_mapping_size() should
> be used.
>
> In this commit, setting max_hw_sectors is moved to nvme_pci_alloc_dev().
> But dma_addressing_limited() depends on the dev->dma_mask, which hasn't
> been set.  dma_addressing_limited() returns "true", and the swiotlb max mapping
> size is used, limiting NVMe transfers to 504 sectors (252 Kbytes).
>
> Prior to this commit, max_hw_sectors isn't set until after the call to
> dma_set_mask_and_coherent() in nvme_pci_enable(), as called from
> nvme_reset_work().   max_hw_sectors is correctly determined based on
> values reported by the NVMe controller.
>
> I haven't provided a fix because I'm not that familiar with the overall structure
> of the code and the intent of the code reorganization.  I'm not sure if setting
> the DMA mask should be moved earlier, or setting max_hw_sectors should
> be moved back to its original location.

Yesterday, I ran into the same problem. Below you can find my test
case. I'm trying to get familiar with the code, so any help would be
much appreciated.

I could reproduce it with a simple dd test [1] and btrace. In summary,
multi-page bvec splits are performed in 4 steps/chunks of 63 segments
(63 * 4K / 512 = 504 sectors) and 1 step of 8 segments (8 * 4K / 512 =
32 sectors). But I think it should be just 4 steps of 64 segments as
that is the max_segments upper limit in my test case. Below you can
find my test case and numbers:

Check:
root@qemuarm64:/sys/block/nvme0n1/queue# grep -H . max_sectors_kb
max_hw_sectors_kb max_segments max_segment_size optimal_io_size
logical_block_size chunk_sectors
max_sectors_kb:252
max_hw_sectors_kb:252
max_segments:64
max_segment_size:4294967295
optimal_io_size:512
logical_block_size:512
chunk_sectors:0

dd test:
dd iflag=direct if=/dev/nvme0n1 bs=1M of=/dev/null status=progress

btrace snippet:
259,0    0    23476     1.111774467   751  Q  RS 1923072 + 2048 [dd]
259,0    0    23477     1.111774842   751  X  RS 1923072 / 1923576 [dd]
259,0    0    23478     1.111775342   751  G  RS 1923072 + 504 [dd]
259,0    0    23479     1.111775425   751  I  RS 1923072 + 504 [dd]
259,0    0    23480     1.111776133   751  X  RS 1923576 / 1924080 [dd]
259,0    0    23481     1.111776258   751  G  RS 1923576 + 504 [dd]
259,0    0    23482     1.111776300   751  I  RS 1923576 + 504 [dd]
259,0    0    23483     1.111776675   751  X  RS 1924080 / 1924584 [dd]
259,0    0    23484     1.111776967   751  G  RS 1924080 + 504 [dd]
259,0    0    23485     1.111777008   751  I  RS 1924080 + 504 [dd]
259,0    0    23486     1.111777383   751  X  RS 1924584 / 1925088 [dd]
259,0    0    23487     1.111777467   751  G  RS 1924584 + 504 [dd]
259,0    0    23488     1.111777550   751  I  RS 1924584 + 504 [dd]
259,0    0    23489     1.111777758   751  G  RS 1925088 + 32 [dd]
259,0    0    23490     1.111777800   751  I  RS 1925088 + 32 [dd]
259,0    0    23491     1.111779383    36  D  RS 1923072 + 504 [kworker/0:1H]
259,0    0    23492     1.111780092    36  D  RS 1923576 + 504 [kworker/0:1H]
259,0    0    23493     1.111780800    36  D  RS 1924080 + 504 [kworker/0:1H]
259,0    0    23494     1.111781425    36  D  RS 1924584 + 504 [kworker/0:1H]
259,0    0    23495     1.111781717    36  D  RS 1925088 + 32 [kworker/0:1H]
259,0    0    23496     1.112201967   749  C  RS 1923072 + 504 [0]
259,0    0    23497     1.112563925   749  C  RS 1923072 + 2048 [0]
259,0    0    23498     1.112564425   749  C  RS 1923072 + 2016 [0]
259,0    0    23499     1.112564800   749  C  RS 1923072 + 1512 [0]
259,0    0    23500     1.112758217   749  C  RS 1923072 + 1008 [0]

In addition, going back to Michaels reference commit and running the
test in the same setup, I got the following checks:

max_sectors_kb:512
max_hw_sectors_kb:512
max_segments:127
max_segment_size:4294967295
optimal_io_size:512
logical_block_size:512

So, I'm not sure why my max_segments when from 64 -> 127 and,
max_sectors_kb and max_hw_sectdors_kb from 252 -> 512. Perhaps my
first assumption was wrong?

[1] test:
https://unix.stackexchange.com/questions/529529/why-is-the-size-of-my-io-requests-being-limited-to-about-512k

Daniel

>
> Michael
>
>
>
