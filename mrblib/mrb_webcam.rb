class Webcam
  attr_accessor :haarcascade_path, :smile_cascade_path
  attr_accessor :fmt, :capture_cb, :face_cb, :smile_cb
  attr_accessor :width, :height
  
  def init2
    @haarcascade_path = ""
    @smile_cascade_path = ""
    @fmt = ".jpg"
    @width = -1
    @height = -1
  end
  
  def setFmt(ext)
    @fmt = "." + ext
    #p @fmt
  end

  def set_size(w, h)
    @width = w
    @height = h
  end

  def bye
    self.hello + " bye"
  end

  def capture(&blk)
    @capture_cb = blk
  end

  def face(hash, &blk)
    # 検出器のパスが設定されているか？
    if hash["haarcascade_path"]
      @haarcascade_path = hash["haarcascade_path"]
    else
       @haarcascade_path = "/usr/local/opt/opencv3/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml"
    end

    @face_cb = blk
  end

  def smile(hash, &blk)
    if hash["haarcascade_path"]
      @haarcascade_path = hash["haarcascade_path"]
    else
       @haarcascade_path = "/usr/local/opt/opencv3/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml"
    end

    if hash["smile_cascade_path"]
      @smile_cascade_path = hash["smile_cascade_path"]
    else
      @smile_cascade_path = "/usr/local/opt/opencv3/share/OpenCV/haarcascades/haarcascade_smile.xml"
    end

    @smile_cb = blk
  end
end
